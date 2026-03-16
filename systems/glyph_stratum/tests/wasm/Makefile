# Makefile for WASM test programs
#
# Requires: wat2wasm (from wabt package)
#
# Ubuntu: sudo apt install wabt
# macOS: brew install wabt

WAT2WASM = wat2wasm

all: simple_loop.wasm

simple_loop.wasm: simple_loop.wat
	$(WAT2WASM) $< -o $@

# Additional test programs can be added here
# conditional.wasm: conditional.wat
# 	$(WAT2WASM) $< -o $@

clean:
	rm -f *.wasm

.PHONY: all clean
