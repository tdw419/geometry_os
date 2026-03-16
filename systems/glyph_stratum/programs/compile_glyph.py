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
    "SPAWN": 232,
    "ATTENTION_FOCUS": 233,
    "GLYPH_MUTATE": 234,
    "SEMANTIC_MERGE": 235,
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
    "BEQ": 0, "BNE": 1, "BLT": 2, "BGE": 3, "BLTU": 4, "BGEU": 5, "JZ": 0, "JNZ": 1,
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

    # Pass 2: Instruction Generation (with PC-relative jumps)
    final_pixels = []
    current_addr = 0  # Track address for PC-relative offsets

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
            current_addr += 2
        elif op_name == "JAL":
            rd = int(parts[1].lower().replace("r", ""))
            val_str = parts[2]
            target_addr = symbols.get(val_str, 0)
            if target_addr == 0:
                try: target_addr = int(val_str, 0)
                except: target_addr = 0

            # PC-relative: offset = target - (current_addr + 2)
            # Store as signed 32-bit offset
            offset = target_addr - (current_addr + 2)
            imm = offset & 0xFFFFFFFF  # Convert to unsigned for storage

            final_pixels.append([opcode, 2, rd, 0])
            final_pixels.append([imm & 0xFF, (imm >> 8) & 0xFF, (imm >> 16) & 0xFF, (imm >> 24) & 0xFF])
            current_addr += 2
        elif op_name in BRANCH_CONDS:
            cond = BRANCH_CONDS[op_name]
            rs2 = 0
            # Check if it's single-operand format: JZ label (implicit r0 check)
            # or two-operand format: JZ r1, label
            if len(parts) == 2 or (len(parts) >= 2 and not parts[1].lower().startswith("r")):
                # Single operand: JZ label -> rs1=0 (check implicit zero from prev op)
                rs1 = 0
                target_str = parts[1]
            elif op_name not in ("JZ", "JNZ"):
                rs1 = int(parts[1].lower().replace("r", ""))
                rs2 = int(parts[2].lower().replace("r", ""))
                target_str = parts[3]
            else:
                rs1 = int(parts[1].lower().replace("r", ""))
                target_str = parts[2]

            target_addr = symbols.get(target_str, 0)
            if target_addr == 0:
                try: target_addr = int(target_str, 0)
                except: target_addr = 0

            # PC-relative: offset = target - (current_addr + 2)
            # Store as signed 32-bit offset
            offset = target_addr - (current_addr + 2)
            imm = offset & 0xFFFFFFFF  # Convert to unsigned for storage

            final_pixels.append([opcode, cond, rs1, rs2])
            final_pixels.append([imm & 0xFF, (imm >> 8) & 0xFF, (imm >> 16) & 0xFF, (imm >> 24) & 0xFF])
            current_addr += 2
        elif op_name == "SPAWN":
            # SPAWN dst, src, count
            # Maps to: opcode=232, stratum=target, p1=source, p2=count
            target = int(parts[1], 0) if len(parts) > 1 else 0
            src = int(parts[2], 0) if len(parts) > 2 else 0
            count = int(parts[3], 0) if len(parts) > 3 else 0
            final_pixels.append([opcode, target & 0xFF, src & 0xFF, count & 0xFF])
            current_addr += 1
        elif op_name == "M_STORE":
            # M_STORE dst, imm -> mem[dst] = imm
            # VM: stratum=dst, p1=imm
            dst = int(parts[1], 0) if len(parts) > 1 else 0
            imm = int(parts[2], 0) if len(parts) > 2 else 0
            final_pixels.append([opcode, dst & 0xFF, imm & 0xFF, 0])
            current_addr += 1
        elif op_name == "GLYPH_WRITE":
            # GLYPH_WRITE target, source, count
            # VM: stratum=target, p1=source, p2=count
            target = int(parts[1], 0) if len(parts) > 1 else 0
            source = int(parts[2], 0) if len(parts) > 2 else 0
            count = int(parts[3], 0) if len(parts) > 3 else 0
            final_pixels.append([opcode, target & 0xFF, source & 0xFF, count & 0xFF])
            current_addr += 1
        elif op_name == "M_JUMP":
            # M_JUMP target -> pc = target
            # VM: stratum=target
            target = int(parts[1], 0) if len(parts) > 1 else 0
            final_pixels.append([opcode, target & 0xFF, 0, 0])
            current_addr += 1
        elif op_name == "ATTENTION_FOCUS":
            # ATTENTION_FOCUS start_addr, end_addr, vm_id
            # opcode=233, stratum=start, p1=end, dst=vm_id
            start_addr = int(parts[1], 0) if len(parts) > 1 else 0
            end_addr = int(parts[2], 0) if len(parts) > 2 else 0
            vm_id = int(parts[3], 0) if len(parts) > 3 else 0
            final_pixels.append([233, start_addr & 0xFF, end_addr & 0xFF, vm_id & 0xFF])
            current_addr += 1
        elif op_name == "GLYPH_MUTATE":
            # GLYPH_MUTATE target_addr, field_offset, new_value
            # opcode=234, stratum=target, p1=field_offset, p2=new_value
            target_addr = int(parts[1], 0) if len(parts) > 1 else 0
            field_offset = int(parts[2], 0) if len(parts) > 2 else 0
            new_value = int(parts[3], 0) if len(parts) > 3 else 0
            final_pixels.append([234, target_addr & 0xFF, field_offset & 0xFF, new_value & 0xFF])
            current_addr += 1
        elif op_name == "SEMANTIC_MERGE":
            # SEMANTIC_MERGE src, dst, count
            # opcode=235, stratum=src, p1=dst, p2=count
            src_addr = int(parts[1], 0) if len(parts) > 1 else 0
            dst_addr = int(parts[2], 0) if len(parts) > 2 else 0
            count = int(parts[3], 0) if len(parts) > 3 else 0
            final_pixels.append([235, src_addr & 0xFF, dst_addr & 0xFF, count & 0xFF])
            current_addr += 1
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
            current_addr += 1

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

def compile_glyph_raw(source_path, output_path):
    """Compile glyph to raw binary (4 bytes per pixel, RGBA order, linear)"""
    with open(source_path) as f:
        source = f.read()
    pixels_data = parse_glyph(source)

    # Write raw bytes: each pixel is 4 bytes (RGBA)
    with open(output_path, 'wb') as f:
        for pixel in pixels_data:
            f.write(bytes(pixel))  # R, G, B, A
    print(f"Compiled {len(pixels_data)} pixels to raw binary {output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: compile_glyph.py <in> <out> [--raw]")
        sys.exit(1)
    if len(sys.argv) > 3 and sys.argv[3] == "--raw":
        compile_glyph_raw(sys.argv[1], sys.argv[2])
    else:
        compile_glyph_file(sys.argv[1], sys.argv[2])
