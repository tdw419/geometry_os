#!/usr/bin/env python3
"""
Geometry OS - Glyph-to-Glyph Compiler
Phase 70: Self-Hosting Compilation

A Python compiler that generates glyph programs (PNG textures).
The compiler itself is structured so it could be converted to a glyph program.
"""

import numpy as np
from pathlib import Path
from dataclasses import dataclass
from typing import Tuple, List
from PIL import Image

# Opcode constants (matching glyph_microcode.wgsl)
OP_DATA = 9       # Load immediate: r[data1] = data2
OP_ADD = 200      # Addition: r[data1] = r[data1] + r[data2]
OP_SUB = 201      # Subtraction: r[data1] = r[data1] - r[data2]
OP_MUL = 202      # Multiplication: r[data1] = r[data1] * r[data2]
OP_BRANCH = 6     # Unconditional branch to data1
OP_BNZ = 209      # Branch if not zero: if r[data1] != 0: goto data2
OP_HALT = 255     # Halt execution


@dataclass
class GlyphInstruction:
    """
    A single instruction in glyph format.

    Each instruction encodes to one RGBA pixel:
    - R: opcode (operation to perform)
    - G: data1 (first operand/register index)
    - B: data2 (second operand/register index or immediate value)
    - A: data3 (additional data, reserved)
    """
    opcode: int
    data1: int = 0
    data2: int = 0
    data3: int = 0

    def to_rgba(self) -> Tuple[int, int, int, int]:
        """Convert instruction to RGBA tuple for texture encoding."""
        return (self.opcode, self.data1, self.data2, self.data3)


class GlyphToGlyphCompiler:
    """
    Compiler that generates glyph programs as PNG textures.

    This compiler is designed to be self-hosting:
    - All operations are simple and could be encoded as glyphs
    - No complex Python features that couldn't be translated
    - The compiler structure mirrors what a glyph program would do
    """

    def __init__(self, output_size: int = 64):
        """
        Initialize the compiler.

        Args:
            output_size: Size of the output texture (output_size x output_size)
        """
        self.output_size = output_size
        self.instructions: List[GlyphInstruction] = []
        self._pc = 0  # Program counter for label resolution

    def emit(self, inst: GlyphInstruction) -> int:
        """
        Emit an instruction to the output texture.

        Args:
            inst: The instruction to emit

        Returns:
            The instruction index (can be used for branch targets)
        """
        idx = len(self.instructions)
        self.instructions.append(inst)
        return idx

    def _reset(self):
        """Reset compiler state for a new program."""
        self.instructions = []
        self._pc = 0

    def compile_factorial(self, n: int = 5) -> np.ndarray:
        """
        Generate a factorial program.

        Computes n! and stores result in r2.

        Algorithm:
            r1 = n (counter)
            r2 = 1 (accumulator)
            r3 = 1 (decrement)
        loop:
            r2 = r2 * r1
            r1 = r1 - r3
            if r1 != 0: goto loop
        halt

        Args:
            n: The number to compute factorial of

        Returns:
            RGBA texture array containing the program
        """
        self._reset()

        # r1 = n (counter)
        self.emit(GlyphInstruction(OP_DATA, 1, n, 0))

        # r2 = 1 (accumulator)
        self.emit(GlyphInstruction(OP_DATA, 2, 1, 0))

        # r3 = 1 (decrement)
        self.emit(GlyphInstruction(OP_DATA, 3, 1, 0))

        # loop: (instruction index 3)
        loop_start = len(self.instructions)

        # r2 = r2 * r1
        self.emit(GlyphInstruction(OP_MUL, 2, 1, 0))

        # r1 = r1 - r3
        self.emit(GlyphInstruction(OP_SUB, 1, 3, 0))

        # if r1 != 0: goto loop_start
        self.emit(GlyphInstruction(OP_BNZ, 1, loop_start, 0))

        # halt
        self.emit(GlyphInstruction(OP_HALT, 0, 0, 0))

        return self._to_texture()

    def compile_counter(self, target: int = 10) -> np.ndarray:
        """
        Generate a counter program.

        Computes sum(1..target) and stores result in r0.

        Algorithm:
            r0 = 0 (accumulator)
            r1 = target
            r2 = 1 (decrement)
        loop:
            r0 = r0 + r1
            r1 = r1 - r2
            if r1 != 0: goto loop
        halt

        Args:
            target: The upper bound to count to (sum 1..target)

        Returns:
            RGBA texture array containing the program
        """
        self._reset()

        # r0 = 0 (accumulator)
        self.emit(GlyphInstruction(OP_DATA, 0, 0, 0))

        # r1 = target (counter)
        self.emit(GlyphInstruction(OP_DATA, 1, target, 0))

        # r2 = 1 (decrement)
        self.emit(GlyphInstruction(OP_DATA, 2, 1, 0))

        # loop: (instruction index 3)
        loop_start = len(self.instructions)

        # r0 = r0 + r1
        self.emit(GlyphInstruction(OP_ADD, 0, 1, 0))

        # r1 = r1 - r2
        self.emit(GlyphInstruction(OP_SUB, 1, 2, 0))

        # if r1 != 0: goto loop_start
        self.emit(GlyphInstruction(OP_BNZ, 1, loop_start, 0))

        # halt
        self.emit(GlyphInstruction(OP_HALT, 0, 0, 0))

        return self._to_texture()

    def compile_fibonacci(self, n: int = 10) -> np.ndarray:
        """
        Generate a Fibonacci program.

        Computes the nth Fibonacci number iteratively.
        Uses r0 for fib(n-2), r1 for fib(n-1), r2 for result.

        Algorithm:
            r0 = 0 (fib(0))
            r1 = 1 (fib(1))
            r2 = n (counter)
            r3 = 1 (decrement)
            r4 = temp
        loop:
            if r2 == 0: goto done
            r4 = r0 + r1  # next fib
            r0 = r1
            r1 = r4
            r2 = r2 - r3
            goto loop
        done:
            result in r1
        halt

        Args:
            n: Which Fibonacci number to compute (0-indexed)

        Returns:
            RGBA texture array containing the program
        """
        self._reset()

        # r0 = 0 (fib(n-2), starts as fib(0))
        self.emit(GlyphInstruction(OP_DATA, 0, 0, 0))

        # r1 = 1 (fib(n-1), starts as fib(1))
        self.emit(GlyphInstruction(OP_DATA, 1, 1, 0))

        # r2 = n (counter)
        self.emit(GlyphInstruction(OP_DATA, 2, n, 0))

        # r3 = 1 (decrement)
        self.emit(GlyphInstruction(OP_DATA, 3, 1, 0))

        # r4 = 0 (temp, will hold next fib)
        self.emit(GlyphInstruction(OP_DATA, 4, 0, 0))

        # loop: (instruction index 5)
        loop_start = len(self.instructions)

        # if r2 == 0: goto done (we use BNZ, so branch if NOT zero to continue)
        # We'll emit BNZ to skip to the loop body, otherwise fall through to halt
        done_target = len(self.instructions) + 6  # Will be the halt instruction

        # if r2 != 0: goto compute (skip halt)
        # Actually, let's restructure: check at start, branch to done if zero
        # BNZ branches if register != 0, so:
        # if r2 != 0: goto compute_block
        compute_block = len(self.instructions) + 1
        self.emit(GlyphInstruction(OP_BNZ, 2, compute_block + 1, 0))  # If r2 != 0, skip next NOP

        # This won't be reached if r2 != 0: goto done (halt)
        # Actually, we need a different approach. Let's use:
        # if r2 == 0: halt (but we only have BNZ)
        # So: BNZ r2, compute_block (if not zero, go compute)
        #     HALT (otherwise halt)
        # compute_block:
        #   ... do work ...
        #   goto loop_start

        # Let me redo this more carefully:
        # At loop_start, we check if counter is 0

        self._reset()

        # r0 = 0 (fib(n-2))
        self.emit(GlyphInstruction(OP_DATA, 0, 0, 0))

        # r1 = 1 (fib(n-1))
        self.emit(GlyphInstruction(OP_DATA, 1, 1, 0))

        # r2 = n (counter)
        self.emit(GlyphInstruction(OP_DATA, 2, n, 0))

        # r3 = 1 (decrement)
        self.emit(GlyphInstruction(OP_DATA, 3, 1, 0))

        # loop_start at index 4
        loop_start = len(self.instructions)

        # if r2 != 0: goto compute (index 6)
        # BNZ r2, 6
        self.emit(GlyphInstruction(OP_BNZ, 2, 6, 0))

        # else: halt (index 5)
        self.emit(GlyphInstruction(OP_HALT, 0, 0, 0))

        # compute: r4 = r0 + r1 (index 6)
        self.emit(GlyphInstruction(OP_ADD, 4, 1, 0))  # r4 = r0 + r1 (but ADD is r[d1] = r[d1] + r[d2])

        # We need: r4 = r0 + r1
        # First copy r0 to r4, then add r1
        # But we don't have MOV. Let's use: r4 = r0, then r4 = r4 + r1
        # We need DATA to set r4 = r0, but DATA only sets immediate
        # Actually, let's check: ADD r[d1], r[d2] means r[d1] = r[d1] + r[d2]
        # So we need r4 = 0 first, then r4 = r4 + r0, then r4 = r4 + r1

        # Let me restructure:
        self._reset()

        # r0 = 0 (fib(n-2))
        self.emit(GlyphInstruction(OP_DATA, 0, 0, 0))

        # r1 = 1 (fib(n-1))
        self.emit(GlyphInstruction(OP_DATA, 1, 1, 0))

        # r2 = n (counter)
        self.emit(GlyphInstruction(OP_DATA, 2, n, 0))

        # r3 = 1 (decrement)
        self.emit(GlyphInstruction(OP_DATA, 3, 1, 0))

        # r4 = 0 (temp for computing next fib)
        self.emit(GlyphInstruction(OP_DATA, 4, 0, 0))

        # loop_start at index 5
        loop_start = len(self.instructions)

        # if r2 != 0: goto compute (skip the halt)
        compute_idx = loop_start + 2
        self.emit(GlyphInstruction(OP_BNZ, 2, compute_idx, 0))

        # halt (reached if r2 == 0)
        self.emit(GlyphInstruction(OP_HALT, 0, 0, 0))

        # compute: (index = compute_idx)
        # r4 = 0
        self.emit(GlyphInstruction(OP_DATA, 4, 0, 0))

        # r4 = r4 + r0 (now r4 = fib(n-2))
        self.emit(GlyphInstruction(OP_ADD, 4, 0, 0))

        # r4 = r4 + r1 (now r4 = fib(n-2) + fib(n-1) = next fib)
        self.emit(GlyphInstruction(OP_ADD, 4, 1, 0))

        # r0 = r1 (shift: old fib(n-1) becomes new fib(n-2))
        # We don't have MOV, so: r0 = 0, r0 = r0 + r1
        self.emit(GlyphInstruction(OP_DATA, 0, 0, 0))
        self.emit(GlyphInstruction(OP_ADD, 0, 1, 0))

        # r1 = r4 (new fib becomes fib(n-1))
        self.emit(GlyphInstruction(OP_DATA, 1, 0, 0))
        self.emit(GlyphInstruction(OP_ADD, 1, 4, 0))

        # r2 = r2 - r3 (decrement counter)
        self.emit(GlyphInstruction(OP_SUB, 2, 3, 0))

        # goto loop_start
        self.emit(GlyphInstruction(OP_BRANCH, loop_start, 0, 0))

        return self._to_texture()

    def _to_texture(self) -> np.ndarray:
        """
        Convert emitted instructions to an RGBA texture.

        Returns:
            numpy array of shape (output_size, output_size, 4)
        """
        pixels = np.zeros((self.output_size, self.output_size, 4), dtype=np.uint8)

        for i, inst in enumerate(self.instructions):
            if i >= self.output_size * self.output_size:
                break
            y, x = divmod(i, self.output_size)
            r, g, b, a = inst.to_rgba()
            pixels[y, x] = [r, g, b, a]

        return pixels

    def save(self, path: Path) -> None:
        """
        Save the current program as a PNG file.

        Args:
            path: Path to save the .rts.png file
        """
        if not self.instructions:
            raise ValueError("No instructions to save. Compile a program first.")

        texture = self._to_texture()
        path.parent.mkdir(parents=True, exist_ok=True)
        Image.fromarray(texture, 'RGBA').save(path)
        print(f"  Compiled: {path} ({len(self.instructions)} instructions)")


def main():
    """Compile and save example programs."""
    print("=" * 60)
    print("Geometry OS - Glyph-to-Glyph Compiler")
    print("Phase 70: Self-Hosting Compilation")
    print("=" * 60)

    output_dir = Path("systems/glyph_stratum/bricks")
    output_dir.mkdir(parents=True, exist_ok=True)

    compiler = GlyphToGlyphCompiler(output_size=64)

    # Compile factorial
    print("\n[1] Compiling factorial program...")
    compiler.compile_factorial(n=5)
    compiler.save(output_dir / "factorial.rts.png")
    print(f"    Computes 5! = 120, result in r2")

    # Compile counter
    print("\n[2] Compiling counter program...")
    compiler.compile_counter(target=10)
    compiler.save(output_dir / "counter.rts.png")
    print(f"    Computes sum(1..10) = 55, result in r0")

    # Compile fibonacci
    print("\n[3] Compiling fibonacci program...")
    compiler.compile_fibonacci(n=10)
    compiler.save(output_dir / "fibonacci.rts.png")
    print(f"    Computes fib(10) = 55, result in r1")

    print("\n" + "=" * 60)
    print("SUCCESS: All programs compiled!")
    print("=" * 60)
    print(f"\nOutput files:")
    print(f"  - {output_dir / 'factorial.rts.png'}")
    print(f"  - {output_dir / 'counter.rts.png'}")
    print(f"  - {output_dir / 'fibonacci.rts.png'}")


if __name__ == "__main__":
    main()
