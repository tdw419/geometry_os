#!/usr/bin/env python3
"""
Simple test runner for WASM interpreter
Loads WASM binary into GPU memory and runs the interpreter
"""

import struct
import sys
import os


def load_wasm_file(filename):
    """Load WASM file as bytes"""
    with open(filename, "rb") as f:
        return f.read()


def create_memory_image(wasm_bytes, entry_point=0):
    """
    Create a memory image for the Geometry OS system:
    - WASM linear memory at 0x20000
    - WASM interpreter at entry_point
    - Stack and globals areas
    """
    # Memory layout (matching wasm_interpreter.glyph assumptions):
    # 0x00000-0x0FFFF: GPU Dev Daemon & scheduler (not used in this test)
    # 0x10000-0x1FFFF: Free space
    # 0x20000-0x2FFFF: WASM Linear Memory (64KB)
    # 0x30000-0x3FFFF: WASM interpreter globals (SP, IP, BP, etc.)
    # 0x40000+: Available for WASM interpreter code

    WASM_MEM_BASE = 0x20000
    WASM_MEM_SIZE = 64 * 1024  # 64KB

    # Create memory buffer (1MB total for simplicity)
    memory = bytearray(1024 * 1024)

    # Place WASM bytes in linear memory
    memory[WASM_MEM_BASE : WASM_MEM_BASE + len(wasm_bytes)] = wasm_bytes

    # Initialize WASM interpreter globals
    # WASM_SP_ADDR = 0x30000 (stack pointer)
    # WASM_IP_ADDR = 0x30004 (instruction pointer)
    # WASM_BP_ADDR = 0x30008 (base pointer)
    # WASM_STATUS = 0x3000C (0=halted,1=running,2=error)
    # WASM_STACK_TOP = 0x30010 (cached top value)

    # Initialize stack pointer to top of linear memory (stack grows down)
    sp_initial = WASM_MEM_BASE + WASM_MEM_SIZE - 4  # 4-byte aligned
    struct.pack_into("<I", memory, 0x30000, sp_initial)

    # Initialize instruction pointer to entry point
    struct.pack_into("<I", memory, 0x30004, entry_point)

    # Initialize base pointer (start of locals area)
    struct.pack_into("<I", memory, 0x30008, 0x28000)

    # Set status to running
    struct.pack_into("<I", memory, 0x3000C, 1)  # STATUS_RUNNING

    # Clear cached stack top
    struct.pack_into("<I", memory, 0x30010, 0)

    # Set WASM_MEM_BASE in r11 equivalent (hardcoded in interpreter)
    # Actually, the interpreter loads this constant directly

    return memory, sp_initial


def save_memory_image(memory, filename):
    """Save memory image as binary file"""
    with open(filename, "wb") as f:
        f.write(memory)


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 run_test.py <wasm_file> [output_image]")
        sys.exit(1)

    wasm_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else "test_image.bin"

    print(f"Loading WASM file: {wasm_file}")
    wasm_bytes = load_wasm_file(wasm_file)
    print(f"WASM size: {len(wasm_bytes)} bytes")

    print("Creating memory image...")
    memory, sp = create_memory_image(wasm_bytes)
    print(f"Stack pointer initialized to: 0x{sp:08x}")

    print(f"Saving memory image: {output_file}")
    save_memory_image(memory, output_file)

    print("\nTo run in Geometry OS:")
    print("1. Load test_image.bin into GPU memory")
    print("2. Set PC to WASM interpreter entry point (0x40000)")
    print("3. Run the system")
    print("\nExpected result: memory[0x20000] should contain the final counter value")


if __name__ == "__main__":
    main()
