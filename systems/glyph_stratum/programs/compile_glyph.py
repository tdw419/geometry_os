#!/usr/bin/env python3
"""
Minimal .glyph to .rts.png compiler.

Compiles .glyph assembly files into RGBA8 texture format for the Glyph VM.
Each pixel encodes one instruction:
  R = opcode (0-255)
  G = stratum (0=SUBSTRATE, 1=MEMORY, 2=LOGIC, 3=SPEC, 4=INTENT)
  B = p1 (parameter 1)
  A = p2 (parameter 2)
"""

import sys
import re
from pathlib import Path

try:
    from PIL import Image
    import numpy as np
except ImportError:
    print("Install: pip install Pillow numpy")
    sys.exit(1)

# Opcode map (from glyph_to_rts.rs)
OPCODES = {
    "NOP": 0, "ALLOC": 1, "FREE": 2, "LOAD": 3, "STORE": 4,
    "ADD": 5, "SUB": 6, "MUL": 7, "DIV": 8, "JMP": 9, "JZ": 10,
    "CALL": 11, "RET": 12, "HALT": 13, "DATA": 14, "LOOP": 15,
    # Extended (200+)
    "ADD_M": 200, "SUB_M": 201, "MUL_M": 202, "DIV_M": 203,
    "LDI": 204, "ST": 205, "MOV": 206, "CLR": 207,
    "JMP": 209, "JLT": 214, "JGT": 215, "ADD_MEM": 216, "SUB_MEM": 217,
    "DRAW": 215, "BRANCH": 220, "CONFIDENCE": 221, "ALTERNATE_PATH": 222,
    "ATTENTION_FOCUS": 223, "GLYPH_MUTATE": 224, "SPATIAL_SPAWN": 225,
    "CAMERA": 230, "HILBERT_D2XY": 231, "TILE_LOAD": 233, "TILE_EVICT": 234,
    "ZOOM": 235, "PAN": 236, "CMP": 214,
}

STRATUM_MAP = {
    "SUBSTRATE": 0, "MEMORY": 1, "LOGIC": 2, "SPEC": 3, "INTENT": 4
}

def hilbert_d2xy(n, d):
    """Convert Hilbert index to (x, y) coordinates."""
    x = y = 0
    s = 1
    t = d
    while s < n:
        rx = 1 & (t // 2)
        ry = 1 & (t ^ rx)
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        x += s * rx
        y += s * ry
        t //= 4
        s *= 2
    return x, y

def parse_glyph(source):
    """Parse .glyph source into instructions."""
    labels = {}
    constants = {}
    instructions = []
    current_addr = 0

    # Pass 1: Collect labels and constants
    for line in source.split('\n'):
        line = line.strip()
        if not line or line.startswith("//") or line.startswith(";"):
            continue
        if line.startswith(".equ"):
            parts = line.split()
            if len(parts) >= 3:
                name = parts[1].rstrip(',')
                try:
                    val = int(parts[2], 0)
                except:
                    val = int(parts[2])
                constants[name] = val
            continue
        if line.startswith(".glyph"):
            # Inline glyph directive - parse manually
            parts = line.split()
            if len(parts) >= 5:
                op = int(parts[1])
                st = int(parts[2])
                p1 = int(parts[3])
                p2 = int(parts[4])
                instructions.append((op, st, p1, p2))
                current_addr += 1
            continue
        if line.startswith("."):
            continue
        if line.startswith(":"):
            label = line[1:].split()[0]
            labels[label] = current_addr
            continue
        current_addr += 1

    # Pass 2: Generate instructions
    current_addr = 0
    for line in source.split('\n'):
        line = line.strip()
        if not line or line.startswith("//") or line.startswith(";") or line.startswith("."):
            continue
        if line.startswith(":"):
            continue

        # Parse instruction
        parts = line.replace(',', ' ').split()
        if not parts:
            continue

        # Get opcode
        op_name = parts[0].upper()
        if op_name not in OPCODES:
            # Check for .glyph directive already handled
            if op_name != ".GLYPH":
                continue

        opcode = OPCODES[op_name]
        stratum = 2  # Default LOGIC
        p1 = 0
        p2 = 0

        # Parse operands
        for i, part in enumerate(parts[1:]):
            part = part.strip()
            if not part:
                continue
            # Check for stratum prefix
            if part.startswith("s:") or part.startswith("S:"):
                stratum = STRATUM_MAP.get(part[2:].upper(), 2)
                continue
            # Check for register
            if part.startswith("r") or part.startswith("R"):
                try:
                    val = int(part[1:])
                except:
                    val = 0
                if i == 0:
                    p1 = val
                else:
                    p2 = val
            # Check for immediate
            elif part.startswith("0x"):
                try:
                    val = int(part, 16)
                except:
                    val = 0
                if i == 0:
                    p1 = val
                else:
                    p2 = val
            else:
                try:
                    val = int(part)
                except:
                    val = 0
                if i == 0:
                    p1 = val
                else:
                    p2 = val

        instructions.append((opcode, stratum, p1, p2))
        current_addr += 1

    return instructions, labels

 constants

def compile_glyph_file(input_path, output_path):
    """Compile a .glyph file to .rts.png."""
    source = Path(input_path).read_text()

    instructions, labels, constants = parse_glyph(source)

    # Use 4096x4096 texture
    width = height = 4096

    # Create image
    img = Image.new('RGBA', (width, height), color=0)
    pixels = np.array(img)

    # Write instructions using Hilbert curve addressing
    for d, (opcode, stratum, p1, p2) in enumerate(instructions):
        x, y = hilbert_d2xy(width, d)
        if x < width and y < height:
            pixels[y, x] = [opcode, stratum, p1, p2]

    # Save
    img = Image.fromarray(pixels.astype(np.uint8))
    img.save(output_path)
    print(f"Compiled {len(instructions)} instructions to {output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: compile_glyph.py <input.glyph> <output.rts.png>")
        sys.exit(1)

    compile_glyph_file(sys.argv[1], sys.argv[2])
