#!/usr/bin/env python3
"""
Geometry OS Glyph Compiler (v3: Constant & Label Support)
"""

import sys
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
    "DATA": 14, "LOOP": 15, "JAL": 16,
    "BEQ": 10, "BNE": 10, "BLT": 10, "BGE": 10, "BLTU": 10, "BGEU": 10,
    "AND": 128, "OR": 129, "XOR": 130, "SHL": 131, "SHR": 132, "SAR": 133,
    "SPAWN": 232, "MUTATE": 233,
    # WGSL-compatible opcodes (glyph_microcode.wgsl)
    "W_NOP": 140, "W_DATA": 128, "W_LOAD": 129, "W_STORE": 130,
    "W_LD": 204, "W_ST": 205, "W_MOV": 206,
    "W_ADD": 142, "W_SUB": 143,
    "W_JMP": 208, "W_JZ": 209,
    "W_DRAW": 215, "W_HALT": 141,
    # glyph_vm_scheduler.wgsl opcodes (200-229)
    "M_NOP": 200, "M_ADD": 201, "M_SUB": 202, "M_MUL": 203, "M_DIV": 204,
    "M_LOAD": 205, "M_STORE": 206, "M_LOADIMM": 207,
    "M_JUMP": 208, "M_JUMPZ": 209, "M_JUMPNZ": 210, "M_CMP": 211,
    "M_AND": 212, "M_OR": 213, "M_XOR": 214, "M_NOT": 215,
    "M_SHL": 216, "M_SHR": 217, "M_CALL": 218, "M_RET": 219,
    "M_PUSH": 220, "M_POP": 221, "M_READ": 222, "M_WRITE": 223,
    "M_SYNC": 224, "M_ATOMIC": 225,
    "GLYPH_WRITE": 232,
}

BRANCH_CONDS = {
    "BEQ": 0, "BNE": 1, "BLT": 2, "BGE": 3, "BLTU": 4, "BGEU": 5, "JZ": 0,
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
    symbols = {}
    instructions = []
    current_addr = 0

    # Pass 1: Collect Labels and Constants
    for line in source.split("\n"):
        line = line.strip().split("//")[0].split(";")[0]
        if not line: continue
        
        if line.startswith(".equ"):
            parts = line.replace(",", " ").split()
            if len(parts) >= 3:
                symbols[parts[1]] = int(parts[2], 0)
            continue
            
        if line.startswith(":"):
            symbols[line[1:].strip()] = current_addr
            continue
            
        if line.upper().startswith("LDI") or line.upper().startswith("JAL") or any(line.upper().startswith(c) for c in BRANCH_CONDS):
            current_addr += 2
        else:
            current_addr += 1

    # Pass 2: Instruction Generation
    final_pixels = []
    for line in source.split("\n"):
        line = line.strip().split("//")[0].split(";")[0]
        if not line or line.startswith(".") or line.startswith(":"): continue

        parts = line.replace(",", " ").split()
        op_name = parts[0].upper()
        if op_name not in OPCODES: continue
        
        opcode = OPCODES[op_name]
        
        if op_name == "LDI":
            rd = int(parts[1].lower().replace("r", ""))
            val_str = parts[2]
            imm = symbols.get(val_str, 0)
            if imm == 0:
                try: imm = int(val_str, 0)
                except: imm = 0
            
            final_pixels.append([opcode, 2, rd, 0])
            final_pixels.append([imm & 0xFF, (imm >> 8) & 0xFF, (imm >> 16) & 0xFF, (imm >> 24) & 0xFF])
        elif op_name == "JAL":
            rd = int(parts[1].lower().replace("r", ""))
            val_str = parts[2]
            imm = symbols.get(val_str, 0)
            if imm == 0:
                try: imm = int(val_str, 0)
                except: imm = 0
            
            final_pixels.append([opcode, 2, rd, 0])
            final_pixels.append([imm & 0xFF, (imm >> 8) & 0xFF, (imm >> 16) & 0xFF, (imm >> 24) & 0xFF])
        elif op_name in BRANCH_CONDS:
            cond = BRANCH_CONDS[op_name]
            rs1 = int(parts[1].lower().replace("r", ""))
            rs2 = 0
            if op_name != "JZ":
                rs2 = int(parts[2].lower().replace("r", ""))
                target_str = parts[3]
            else:
                target_str = parts[2]
                
            imm = symbols.get(target_str, 0)
            if imm == 0:
                try: imm = int(target_str, 0)
                except: imm = 0
                
            final_pixels.append([opcode, cond, rs1, rs2])
            final_pixels.append([imm & 0xFF, (imm >> 8) & 0xFF, (imm >> 16) & 0xFF, (imm >> 24) & 0xFF])
        elif op_name == "SPAWN":
            # SPAWN dst, src, count
            # Maps to: opcode=232, stratum=target, p1=source, p2=count
            target = int(parts[1], 0) if len(parts) > 1 else 0
            src = int(parts[2], 0) if len(parts) > 2 else 0
            count = int(parts[3], 0) if len(parts) > 3 else 0
            final_pixels.append([opcode, target & 0xFF, src & 0xFF, count & 0xFF])
        elif op_name == "M_STORE":
            # M_STORE dst, imm -> mem[dst] = imm
            # VM: stratum=dst, p1=imm
            dst = int(parts[1], 0) if len(parts) > 1 else 0
            imm = int(parts[2], 0) if len(parts) > 2 else 0
            final_pixels.append([opcode, dst & 0xFF, imm & 0xFF, 0])
        elif op_name == "GLYPH_WRITE":
            # GLYPH_WRITE target, source, count
            # VM: stratum=target, p1=source, p2=count
            target = int(parts[1], 0) if len(parts) > 1 else 0
            source = int(parts[2], 0) if len(parts) > 2 else 0
            count = int(parts[3], 0) if len(parts) > 3 else 0
            final_pixels.append([opcode, target & 0xFF, source & 0xFF, count & 0xFF])
        elif op_name == "M_JUMP":
            # M_JUMP target -> pc = target
            # VM: stratum=target
            target = int(parts[1], 0) if len(parts) > 1 else 0
            final_pixels.append([opcode, target & 0xFF, 0, 0])
        else:
            p1 = p2 = 0
            for i, part in enumerate(parts[1:]):
                val = 0
                # Check if it's a register (r followed by digits only)
                if part.lower().startswith("r") and part[1:].isdigit():
                    val = int(part[1:])
                else:
                    # Try symbol first, then literal
                    val = symbols.get(part, None)
                    if val is None:
                        try: val = int(part, 0)
                        except: val = 0
                if i == 0: p1 = val & 0xFF
                else: p2 = val & 0xFF
            final_pixels.append([opcode, 2, p1, p2])

    return final_pixels

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
        print("Usage: compile_glyph.py <in> <out>")
        sys.exit(1)
    compile_glyph_file(sys.argv[1], sys.argv[2])
