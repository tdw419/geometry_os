#!/usr/bin/env python3
"""
Geometry OS Glyph Compiler (32-bit ISA Edition)
Supports .equ directives and full label handling
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

OPCODES = {
    "NOP": 0, "LDI": 1, "MOV": 2, "LOAD": 3, "STORE": 4,
    "ADD": 5, "SUB": 6, "MUL": 7, "DIV": 8, "JMP": 9,
    "JZ": 10, "CALL": 11, "RET": 12, "HALT": 13,
    "AND": 128, "OR": 129, "XOR": 130, "SHL": 131, "SHR": 132, "SAR": 133,
    # Aliases
    "ST": 4, "LD": 3, "JNZ": 10, "JE": 10, "JNE": 10, "CMP": 6,
}

def hilbert_d2xy(n, d):
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
    labels = {}
    equates = {}
    instructions = []
    current_addr = 0

    lines = source.split("\n")

    # Pass 0: Collect .equ directives
    for line in lines:
        line = line.strip()
        if line.startswith(".equ"):
            parts = line.split(",", 1)
            if len(parts) == 2:
                name = parts[0].replace(".equ", "").strip()
                value = parts[1].strip()
                try:
                    equates[name] = int(value, 0)
                except:
                    pass

    # Pass 1: Labels and count instructions
    for line in lines:
        line = line.strip()
        if not line or line.startswith("//") or line.startswith(";"):
            continue
        if line.startswith("."):
            continue  # Skip directives
        if line.startswith(":"):
            labels[line[1:].strip()] = current_addr
            continue

        parts = line.replace(",", " ").split()
        if not parts:
            continue
        op_name = parts[0].upper()
        if op_name not in OPCODES:
            continue

        # LDI takes 2 pixels
        if op_name == "LDI":
            current_addr += 2
        else:
            current_addr += 1

    # Pass 2: Generate instructions
    for line in lines:
        line = line.strip()
        if not line or line.startswith("//") or line.startswith(";") or line.startswith(".") or line.startswith(":"):
            continue

        parts = line.replace(",", " ").split()
        if not parts:
            continue
        op_name = parts[0].upper()
        if op_name not in OPCODES:
            continue

        opcode = OPCODES[op_name]

        if op_name == "LDI":
            # LDI rd, imm
            rd_part = parts[1].lower()
            if rd_part.startswith("r") and rd_part[1:].isdigit():
                rd = int(rd_part[1:])
            else:
                rd = 0
            try:
                imm = int(parts[2], 0)
            except:
                # Check equates first, then labels
                imm = equates.get(parts[2], labels.get(parts[2], 0))
            # First pixel: opcode, stratum=2, dst=rd, p2=0
            instructions.append([opcode, 2, rd, 0])
            # Second pixel: 32-bit immediate
            instructions.append([imm & 0xFF, (imm >> 8) & 0xFF, (imm >> 16) & 0xFF, (imm >> 24) & 0xFF])
        else:
            # Other instructions: OP p1, p2
            p1 = p2 = 0
            for i, part in enumerate(parts[1:]):
                # Stop processing if we hit a comment
                if part.startswith("//") or part.startswith(";"):
                    break
                val = 0
                part_lower = part.lower()
                # Check if it's a register (r followed by only digits)
                if part_lower.startswith("r") and part[1:].isdigit():
                    val = int(part[1:])
                else:
                    # Try numeric parse
                    try:
                        val = int(part, 0)
                    except:
                        # Check equates
                        val = equates.get(part, 0)
                        # Check labels
                        if val == 0:
                            val = labels.get(part, 0)
                if i == 0:
                    p1 = val & 0xFF
                elif i == 1:
                    p2 = val & 0xFF
                else:
                    break  # Only process first two operands
            instructions.append([opcode, 2, p1, p2])

    return instructions

def compile_glyph_file(input_path, output_path):
    source = Path(input_path).read_text()
    pixels_data = parse_glyph(source)
    width = height = 4096
    img = Image.new("RGBA", (width, height), color=0)
    pixels = np.array(img)
    for d, pixel_val in enumerate(pixels_data):
        x, y = hilbert_d2xy(width, d)
        pixels[y, x] = pixel_val
    Image.fromarray(pixels.astype(np.uint8)).save(output_path)
    print(f"Compiled {len(pixels_data)} pixels to {output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: compile_glyph.py <input.glyph> <output.rts.png>")
        sys.exit(1)
    compile_glyph_file(sys.argv[1], sys.argv[2])
