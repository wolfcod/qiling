#!/usr/bin/sh
set -e
if [[ ! -d ./AFLplusplus ]]; then
  git clone https://github.com/AFLplusplus/AFLplusplus.git
  cd AFLplusplus
  make
  cd ./unicorn_mode
  ./build_unicorn_support.sh
  cd ../../
fi
AFL_PATH="$(realpath ./AFLplusplus)" PATH="$AFL_PATH:$PATH" afl-fuzz -i ./afl_inputs -o ./afl_outputs -m none -U -- python3 ./fuzz_x8664_linux.py @@
