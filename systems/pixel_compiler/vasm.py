"""
Visual Assembler (vasm) - Compiles assembly syntax to PixelRTS bytecode
Syntax based on PixelISA v1.0 specification
"""

import re
from dataclasses import dataclass
from typing import List, Dict, Optional

# Import HilbertEngine for space-filling curve encoding
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
class Instruction:
    opcode: int
    dest: int = 0
    src: int = 0
    immediate: int = 0
    address: int = 0  # Resolved address for jumps

@dataclass
class Label:
    name: str
    address: int

class VisualAssembler:
    def __init__(self):
        self.instructions: List[Instruction] = []
        self.labels: Dict[str, int] = {}
        self.pending_labels: List[tuple[str, Instruction]] = []  # (label_name, instruction)
        self.pc = 0  # Program counter

        # Opcode mapping
        self.opcodes = {
            'NOP': 0x00,
            'LOAD': 0x01,
            'MOV': 0x02,
            'ADD': 0x10,
            'SUB': 0x11,
            'MUL': 0x12,
            'DIV': 0x13,
            'JMP': 0x20,
            'JZ': 0x21,
            'JNZ': 0x22,
            'CALL': 0x30,
            'RET': 0x31,
            'TEXTURE': 0x40,
            'SAMPLE': 0x41,
        }

    def parse_line(self, line: str) -> Optional[Instruction]:
        """Parse a single line of assembly"""
        # Strip comments
        line = line.split(';')[0].strip()
        if not line:
            return None

        # Check for label definition
        if line.endswith(':'):
            label_name = line[:-1].strip()
            self.labels[label_name] = self.pc
            return None

        # Parse instruction
        parts = line.split()
        if not parts:
            return None

        mnemonic = parts[0].upper()
        if mnemonic not in self.opcodes:
            raise ValueError(f"Unknown opcode: {mnemonic}")

        opcode = self.opcodes[mnemonic]
        inst = Instruction(opcode=opcode, address=self.pc)

        # Parse operands based on opcode
        if mnemonic in ['LOAD']:
            # LOAD R0, 42
            dest = self._parse_register(parts[1])
            immediate = int(parts[2])
            inst.dest = dest
            inst.immediate = immediate

        elif mnemonic in ['MOV', 'ADD', 'SUB', 'MUL', 'DIV']:
            # ADD R0, R1
            dest = self._parse_register(parts[1])
            src = self._parse_register(parts[2])
            inst.dest = dest
            inst.src = src

        elif mnemonic in ['JMP']:
            # JMP label
            label_ref = parts[1]
            self.pending_labels.append((label_ref, inst))
            inst.immediate = 0  # Placeholder

        elif mnemonic in ['JZ', 'JNZ', 'CALL']:
            # JZ R0, label
            dest = self._parse_register(parts[1])
            label_ref = parts[2]
            inst.dest = dest
            self.pending_labels.append((label_ref, inst))
            inst.immediate = 0  # Placeholder

        elif mnemonic in ['RET']:
            # RET R0
            dest = self._parse_register(parts[1])
            inst.dest = dest

        self.instructions.append(inst)
        self.pc += 1
        return inst

    def _parse_register(self, reg_str: str) -> int:
        """Parse R0-R255"""
        match = re.match(r'R(\d+)', reg_str.upper())
        if not match:
            raise ValueError(f"Invalid register: {reg_str}")
        reg_num = int(match.group(1))
        if reg_num > 255:
            raise ValueError(f"Register number too large: {reg_num}")
        return reg_num

    def resolve_labels(self):
        """Resolve all pending label references"""
        for label_name, inst in self.pending_labels:
            if label_name not in self.labels:
                raise ValueError(f"Undefined label: {label_name}")
            inst.immediate = self.labels[label_name]

    def compile(self, source: str) -> List[Instruction]:
        """Compile full assembly source"""
        lines = source.strip().split('\n')
        for line in lines:
            self.parse_line(line)
        self.resolve_labels()
        return self.instructions

    def encode_to_pixels(self, mode: str = 'standard'):
        """Encode instructions to RGBA pixel array"""
        import numpy as np

        if not self.instructions:
            raise ValueError("No instructions to encode")

        # Calculate grid size (power of 2)
        count = len(self.instructions)
        grid_size = 2**((int(np.ceil(np.sqrt(count))) - 1).bit_length())
        if grid_size < 2:
            grid_size = 2

        # Create RGBA array
        pixels = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Encode each instruction
        hilbert = HilbertEngine()
        for i, inst in enumerate(self.instructions):
            x, y = hilbert.d2xy(grid_size, i)

            # Apply semantic coloring if in code mode
            r, g, b, a = self._encode_instruction(inst, mode)
            pixels[y, x] = [r, g, b, a]

        return pixels

    def _encode_instruction(self, inst: Instruction, mode: str) -> tuple:
        """Encode instruction to RGBA values"""
        r = inst.opcode
        g = inst.dest
        b = inst.src
        a = inst.immediate

        if mode == 'code':
            # Apply semantic coloring
            if 0x20 <= inst.opcode <= 0x31:  # Control flow
                r = max(r, 200)
            elif 0x10 <= inst.opcode <= 0x13:  # Arithmetic
                r = max(r, 128)
            elif 0x01 <= inst.opcode <= 0x02:  # Memory
                r = max(r, 50)

        return (r, g, b, a)

    def save_png(self, output_path: str, mode: str = 'standard'):
        """Save compiled program as .rts.png"""
        try:
            from PIL import Image
            pixels = self.encode_to_pixels(mode)
            img = Image.fromarray(pixels, 'RGBA')
            img.save(output_path)
            return True
        except ImportError:
            raise ImportError("PIL/Pillow is required for PNG output")
