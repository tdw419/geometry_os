"""
Visual Disassembler (vdisasm) - Converts .rts.png back to assembly
"""

import numpy as np
from dataclasses import dataclass
from typing import List

# Import HilbertEngine for space-filling curve decoding
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../evolution'))
try:
    from HilbertEngine import HilbertEngine
except ImportError:
    # Fallback if HilbertEngine is not available
    class HilbertEngine:
        def d2xy(self, n, d):
            """Simple fallback: row-major order"""
            return d % n, d // n

@dataclass
class DisassembledInstruction:
    address: int
    opcode: int
    mnemonic: str
    dest: int
    src: int
    immediate: int

class VisualDisassembler:
    def __init__(self):
        self.opcodes = {
            0x00: 'NOP',
            0x01: 'LOAD',
            0x02: 'MOV',
            0x10: 'ADD',
            0x11: 'SUB',
            0x12: 'MUL',
            0x13: 'DIV',
            0x20: 'JMP',
            0x21: 'JZ',
            0x22: 'JNZ',
            0x30: 'CALL',
            0x31: 'RET',
            0x40: 'TEXTURE',
            0x41: 'SAMPLE',
        }

    def disassemble_file(self, png_path: str) -> List[DisassembledInstruction]:
        """Disassemble a .rts.png file"""
        try:
            from PIL import Image
            img = Image.open(png_path).convert('RGBA')
            pixels = np.array(img)
            return self.disassemble_pixels(pixels)
        except ImportError:
            raise ImportError("PIL/Pillow is required for PNG input")

    def disassemble_pixels(self, pixels: np.ndarray) -> List[DisassembledInstruction]:
        """Disassemble pixel array"""
        grid_size = pixels.shape[0]
        hilbert = HilbertEngine()

        instructions = []
        for i in range(grid_size * grid_size):
            x, y = hilbert.d2xy(grid_size, i)
            r, g, b, a = pixels[y, x]

            # Skip NOP (all zeros)
            if r == 0 and g == 0 and b == 0 and a == 0:
                # Check if this is end of program
                if not instructions:
                    continue
                # Stop at first NOP after real instructions
                break

            mnemonic = self.opcodes.get(r, '???')

            inst = DisassembledInstruction(
                address=i,
                opcode=r,
                mnemonic=mnemonic,
                dest=g,
                src=b,
                immediate=a
            )
            instructions.append(inst)

        return instructions

    def format_assembly(self, instructions: List[DisassembledInstruction]) -> str:
        """Format instructions as assembly text"""
        lines = []
        for inst in instructions:
            if inst.mnemonic == '???':
                lines.append(f"; Unknown opcode 0x{inst.opcode:02x} at address {inst.address}")
                continue

            if inst.mnemonic == 'NOP':
                continue

            # Format based on instruction type
            if inst.mnemonic in ['LOAD']:
                line = f"{inst.mnemonic} R{inst.dest}, {inst.immediate}"
            elif inst.mnemonic in ['MOV', 'ADD', 'SUB', 'MUL', 'DIV']:
                line = f"{inst.mnemonic} R{inst.dest}, R{inst.src}"
            elif inst.mnemonic == 'JMP':
                line = f"{inst.mnemonic} addr_{inst.immediate}"
            elif inst.mnemonic in ['JZ', 'JNZ', 'CALL']:
                line = f"{inst.mnemonic} R{inst.dest}, addr_{inst.immediate}"
            elif inst.mnemonic == 'RET':
                line = f"{inst.mnemonic} R{inst.dest}"
            else:
                line = f"; {inst.mnemonic} (unsupported formatting)"

            lines.append(line)

        return '\n'.join(lines)
