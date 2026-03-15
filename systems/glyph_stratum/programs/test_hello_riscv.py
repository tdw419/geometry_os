#!/usr/bin/env python3
"""
Create a minimal RISC-V test program that prints "GEOS" to UART.
This will be loaded at 0x8000 in the emulator's guest RAM.
"""

import struct

def to_u32(val):
    """Ensure value is in valid 32-bit unsigned range"""
    return val & 0xFFFFFFFF

def encode_addi(rd, rs1, imm):
    """ADDI rd, rs1, imm - 12-bit signed immediate"""
    # Sign-extend 12-bit immediate to handle negatives
    imm = imm & 0xFFF
    return to_u32((imm << 20) | (rs1 << 15) | (0 << 12) | (rd << 7) | 0x13)

def encode_sw(rs2, rs1, imm):
    """SW rs2, imm(rs1) - Store word"""
    imm_lo = imm & 0x1F
    imm_hi = (imm >> 5) & 0x7F
    return to_u32((imm_hi << 25) | (rs2 << 20) | (rs1 << 15) | (2 << 12) | (imm_lo << 7) | 0x23)

def encode_lui(rd, imm):
    """LUI rd, imm - Load upper immediate (20-bit unsigned)"""
    imm = (imm >> 12) & 0xFFFFF
    return to_u32((imm << 12) | (rd << 7) | 0x37)

def encode_jal(rd, offset):
    """JAL rd, offset - Jump and link (20-bit signed offset)"""
    # Handle signed offset
    if offset < 0:
        offset = offset & 0xFFFFF
    # Complex encoding: imm[20|10:1|11|19:12]
    imm = offset & 0xFFFFF
    imm_20 = (imm >> 19) & 1
    imm_10_1 = (imm >> 1) & 0x3FF
    imm_11 = (imm >> 11) & 1
    imm_19_12 = (imm >> 12) & 0xFF
    return to_u32((imm_20 << 31) | (imm_10_1 << 21) | (imm_11 << 20) | (imm_19_12 << 12) | (rd << 7) | 0x6F)

def encode_add(rd, rs1, rs2):
    """ADD rd, rs1, rs2"""
    return to_u32((0 << 25) | (rs2 << 20) | (rs1 << 15) | (0 << 12) | (rd << 7) | 0x33)

def encode_li(rd, imm):
    """LI rd, imm - pseudo-instruction (ADDI rd, x0, imm)"""
    return encode_addi(rd, 0, imm)

# Register aliases
x0, x1, x2, x3, x4, x5, x6, x7 = 0, 1, 2, 3, 4, 5, 6, 7

# Build the program
program = []

# For our simplified emulator:
# - UART is at address 0x1000 (word-addressed)
# - We use ADDI to load small values

# Load UART base address: x1 = 0x1000
# Since 0x1000 > 2047 (max 12-bit signed), we need LUI + ADDI
# LUI x1, 1  (x1 = 4096 = 0x1000)
program.append(encode_lui(x1, 0x1000))  # x1 = 0x1000

# Print 'G' (71)
program.append(encode_li(x2, 71))       # x2 = 'G'
program.append(encode_sw(x2, x1, 0))    # SW x2, 0(x1) - write to UART

# Print 'E' (69)
program.append(encode_li(x2, 69))       # x2 = 'E'
program.append(encode_sw(x2, x1, 0))    # SW x2, 0(x1)

# Print 'O' (79)
program.append(encode_li(x2, 79))       # x2 = 'O'
program.append(encode_sw(x2, x1, 0))    # SW x2, 0(x1)

# Print 'S' (83)
program.append(encode_li(x2, 83))       # x2 = 'S'
program.append(encode_sw(x2, x1, 0))    # SW x2, 0(x1)

# Print newline '\n' (10)
program.append(encode_li(x2, 10))       # x2 = '\n'
program.append(encode_sw(x2, x1, 0))    # SW x2, 0(x1)

# Infinite loop: JAL x0, . (offset = -4)
# For infinite loop, jump to self = offset 0 from current instruction
program.append(encode_jal(x0, 0))       # Jump to self

# Convert to bytes (little-endian)
output = b''.join(struct.pack('<I', inst) for inst in program)

# Write to file
with open('/tmp/hello_geos.riscv.bin', 'wb') as f:
    f.write(output)

print(f"Created RISC-V test binary: {len(output)} bytes, {len(program)} instructions")
print("\nDisassembly:")
for i, inst in enumerate(program):
    addr = 0x8000 + i * 4
    print(f"  0x{addr:04X}: 0x{inst:08X}")

# Also create as .rts.png for the emulator
# Each 32-bit instruction becomes 4 pixels (RGBA)
# For simplicity, store as raw float texture
import numpy as np
from PIL import Image

# Convert instructions to RGBA pixels
pixels = []
for inst in program:
    # Store instruction as 4 bytes (BGRA for little-endian)
    b0 = inst & 0xFF
    b1 = (inst >> 8) & 0xFF
    b2 = (inst >> 16) & 0xFF
    b3 = (inst >> 24) & 0xFF
    pixels.append([b0, b1, b2, b3])

# Pad to power of 2 texture
width = 64  # 64 pixels wide
height = (len(pixels) + width - 1) // width
pixels_padded = pixels + [[0,0,0,0]] * (width * height - len(pixels))

# Create image
arr = np.array(pixels_padded, dtype=np.uint8).reshape(height, width, 4)
img = Image.fromarray(arr, 'RGBA')
img.save('/tmp/hello_geos.rts.png')
print(f"\nCreated texture: /tmp/hello_geos.rts.png ({width}x{height})")

print("\nTo test in the emulator:")
print("  1. Load hello_geos.rts.png at Hilbert offset 0x8000")
print("  2. Run qemu_riscv.glyph")
print("  3. Check UART buffer at 0x0200 for 'GEOS'")
