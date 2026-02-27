#!/usr/bin/env python3
"""
Geometry OS: Visual CPU Emulator

Executes .rts.png textures by decoding RGBA opcodes.
This is the CPU side of the "Screen is the Hard Drive" architecture.
"""

import numpy as np
from PIL import Image
from typing import List, Dict, Optional
from dataclasses import dataclass, field


# Opcode constants (from visual_cpu.wgsl)
OP_UNREACHABLE = 0x00
OP_NOP = 0x01
OP_BLOCK = 0x02
OP_LOOP = 0x03
OP_CALL = 0x10
OP_DROP = 0x1A
OP_SELECT = 0x1B
OP_LOCAL_GET = 0x20
OP_LOCAL_SET = 0x21
OP_I32_CONST = 0x41
OP_I32_EQZ = 0x45
OP_I32_ADD = 0x6A
OP_I32_SUB = 0x6B
OP_I32_MUL = 0x6C

OPCODE_NAMES = {
    0x00: 'unreachable',
    0x01: 'nop',
    0x02: 'block',
    0x03: 'loop',
    0x10: 'call',
    0x1A: 'drop',
    0x1B: 'select',
    0x20: 'local.get',
    0x21: 'local.set',
    0x41: 'i32.const',
    0x45: 'i32.eqz',
    0x6A: 'i32.add',
    0x6B: 'i32.sub',
    0x6C: 'i32.mul',
}


@dataclass
class ExecutionState:
    """State of the Visual CPU during execution."""
    pc: int = 0                    # Program counter (glyph index)
    stack: List[int] = field(default_factory=list)  # Value stack
    locals: Dict[int, int] = field(default_factory=dict)  # Local variables
    cycles: int = 0                # Cycle count
    halted: bool = False           # Halt flag
    output: List[str] = field(default_factory=list)  # Console output


class VisualCPUEmulator:
    """
    Emulates the Visual CPU shader logic in Python.

    Executes RGBA-encoded textures where:
    - R = opcode
    - G = operand high byte
    - B = operand low byte
    - A = execution mask (>0 = execute)
    """

    GLYPH_SIZE = 16

    def __init__(self, debug: bool = False):
        self.debug = debug
        self.state = ExecutionState()
        self.instructions: List[Dict] = []

    def load_texture(self, path: str) -> int:
        """
        Load an .rts.png texture and decode instructions.

        Returns number of instructions loaded.
        """
        img = Image.open(path).convert('RGBA')
        pixels = np.array(img)

        width = img.width
        height = img.height

        if height != self.GLYPH_SIZE:
            raise ValueError(f"Invalid texture height: {height}, expected {self.GLYPH_SIZE}")

        num_glyphs = width // self.GLYPH_SIZE
        self.instructions = []

        for i in range(num_glyphs):
            x_offset = i * self.GLYPH_SIZE

            # Sample center pixel of glyph
            y = self.GLYPH_SIZE // 2
            x = x_offset + self.GLYPH_SIZE // 2

            r, g, b, a = pixels[y, x]

            # Only add if alpha > 0 (executable pixel)
            if a > 0:
                opcode = int(r)
                operand = (int(g) << 8) | int(b)
                self.instructions.append({
                    'index': i,
                    'opcode': opcode,
                    'operand': operand,
                    'alpha': int(a)
                })

        # Reset state
        self.state = ExecutionState()

        if self.debug:
            print(f"Loaded {len(self.instructions)} instructions from {path}")
            for inst in self.instructions:
                name = OPCODE_NAMES.get(inst['opcode'], f'0x{inst["opcode"]:02X}')
                print(f"  [{inst['index']}] {name} {inst['operand']}")

        return len(self.instructions)

    def step(self) -> bool:
        """
        Execute one instruction.

        Returns True if execution should continue, False if halted.
        """
        if self.state.halted:
            return False

        if self.state.pc >= len(self.instructions):
            self.state.halted = True
            return False

        inst = self.instructions[self.state.pc]
        opcode = inst['opcode']
        operand = inst['operand']

        # Get opcode name for debugging
        name = OPCODE_NAMES.get(opcode, f'0x{opcode:02X}')

        if self.debug:
            stack_str = str(self.state.stack[-5:]) if self.state.stack else '[]'
            print(f"  PC={self.state.pc}: {name} {operand} | Stack: {stack_str}")

        # Execute instruction
        if opcode == OP_NOP:
            pass

        elif opcode == OP_I32_CONST:
            self.state.stack.append(operand)

        elif opcode == OP_I32_ADD:
            if len(self.state.stack) >= 2:
                b = self.state.stack.pop()
                a = self.state.stack.pop()
                result = (a + b) & 0xFFFFFFFF  # 32-bit wrap
                self.state.stack.append(result)
                if self.debug:
                    print(f"    ADD: {a} + {b} = {result}")

        elif opcode == OP_I32_SUB:
            if len(self.state.stack) >= 2:
                b = self.state.stack.pop()
                a = self.state.stack.pop()
                result = (a - b) & 0xFFFFFFFF
                self.state.stack.append(result)
                if self.debug:
                    print(f"    SUB: {a} - {b} = {result}")

        elif opcode == OP_I32_MUL:
            if len(self.state.stack) >= 2:
                b = self.state.stack.pop()
                a = self.state.stack.pop()
                result = (a * b) & 0xFFFFFFFF
                self.state.stack.append(result)
                if self.debug:
                    print(f"    MUL: {a} * {b} = {result}")

        elif opcode == OP_LOCAL_GET:
            value = self.state.locals.get(operand, 0)
            self.state.stack.append(value)
            if self.debug:
                print(f"    GET: locals[{operand}] = {value}")

        elif opcode == OP_LOCAL_SET:
            if self.state.stack:
                value = self.state.stack.pop()
                self.state.locals[operand] = value
                if self.debug:
                    print(f"    SET: locals[{operand}] = {value}")

        elif opcode == OP_DROP:
            if self.state.stack:
                self.state.stack.pop()

        elif opcode == OP_I32_EQZ:
            if self.state.stack:
                value = self.state.stack.pop()
                self.state.stack.append(1 if value == 0 else 0)

        elif opcode == OP_UNREACHABLE:
            self.state.halted = True
            if self.debug:
                print("    HALT: unreachable")

        else:
            if self.debug:
                print(f"    Unknown opcode: 0x{opcode:02X}")

        self.state.pc += 1
        self.state.cycles += 1

        return not self.state.halted and self.state.pc < len(self.instructions)

    def run(self, max_cycles: int = 1000) -> ExecutionState:
        """
        Run until halt or max cycles reached.

        Returns final execution state.
        """
        if self.debug:
            print("\n=== Running Visual CPU ===")
            print(f"Instructions: {len(self.instructions)}")
            print(f"Max cycles: {max_cycles}")
            print()

        while self.state.cycles < max_cycles:
            if not self.step():
                break

        if self.debug:
            print("\n=== Execution Complete ===")
            print(f"Cycles: {self.state.cycles}")
            print(f"Halted: {self.state.halted}")
            print(f"Final stack: {self.state.stack}")
            print(f"Locals: {self.state.locals}")

        return self.state

    def get_result(self) -> Optional[int]:
        """Get top of stack as result (if any)."""
        return self.state.stack[-1] if self.state.stack else None


def main():
    """CLI for Visual CPU emulator."""
    import argparse

    parser = argparse.ArgumentParser(description='Visual CPU Emulator')
    parser.add_argument('texture', help='Path to .rts.png texture')
    parser.add_argument('-d', '--debug', action='store_true', help='Debug output')
    parser.add_argument('-m', '--max-cycles', type=int, default=1000, help='Max cycles')

    args = parser.parse_args()

    cpu = VisualCPUEmulator(debug=args.debug)
    cpu.load_texture(args.texture)
    state = cpu.run(max_cycles=args.max_cycles)

    print(f"\nResult: {cpu.get_result()}")
    print(f"Locals: {state.locals}")


if __name__ == '__main__':
    main()
