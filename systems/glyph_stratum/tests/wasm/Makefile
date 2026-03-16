# Makefile for WASM test programs
#
# Requires: wat2wasm (from wabt package) OR wasm-tools (cargo install wasm-tools)
#
# Option 1 - wabt (system package):
#   Ubuntu/Debian: sudo apt install wabt
#   macOS:         brew install wabt
#   Fedora:        sudo dnf install wabt
#   Arch:          sudo pacman -S wabt
#
# Option 2 - wasm-tools (cargo):
#   cargo install wasm-tools
#   Then: make COMPILER=wasm-tools
#
# Verify installation: wat2wasm --version OR wasm-tools --version

# Auto-detect compiler (prefer wat2wasm, fallback to wasm-tools)
COMPILER ?= $(shell which wat2wasm 2>/dev/null || echo wasm-tools)

ifeq ($(COMPILER),wat2wasm)
  WAT2WASM = wat2wasm
else
  # wasm-tools uses: wasm-tools print input.wat -o output.wasm
  WAT2WASM = wasm-tools print
endif

all: simple_loop.wasm conditional.wasm

simple_loop.wasm: simple_loop.wat
	$(WAT2WASM) $< -o $@

conditional.wasm: conditional.wat
	$(WAT2WASM) $< -o $@

clean:
	rm -f *.wasm

.PHONY: all clean
