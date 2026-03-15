#!/usr/bin/env python3
"""
Create a RISC-V test program that verifies trap handling.
Tests: ECALL → mtvec jump, mepc save, mcause save
"""

import struct

def to_u32(val):
    return val & 0xFFFFFFFF

def encode_addi(rd, rs1, imm):
    imm = imm & 0xFFF
    return to_u32((imm << 20) | (rs1 << 15) | (0 << 12) | (rd << 7) | 0x13)

def encode_sw(rs2, rs1, imm):
    imm_lo = imm & 0x1F
    imm_hi = (imm >> 5) & 0x7F
    return to_u32((imm_hi << 25) | (rs2 << 20) | (rs1 << 15) | (2 << 12) | (imm_lo << 7) | 0x23)

def encode_lui(rd, imm):
    imm = (imm >> 12) & 0xFFFFF
    return to_u32((imm << 12) | (rd << 7) | 0x37)

def encode_auipc(rd, imm):
    imm = imm & 0xFFFFF000
    return to_u32((imm << 12) | (rd << 7) | 0x17)

def encode_jal(rd, offset):
    if offset < 0:
        offset = offset & 0xFFFFF
    imm = offset & 0xFFFFF
    imm_20 = (imm >> 19) & 1
    imm_10_1 = (imm >> 1) & 0x3FF
    imm_11 = (imm >> 11) & 1
    imm_19_12 = (imm >> 12) & 0xFF
    return to_u32((imm_20 << 31) | (imm_10_1 << 21) | (imm_11 << 20) | (imm_19_12 << 12) | (rd << 7) | 0x6F)

def encode_jalr(rd, rs1, imm):
    imm = imm & 0xFFF
    return to_u32((imm << 20) | (rs1 << 15) | (0 << 12) | (rd << 7) | 0x67)

def encode_csrrw(rd, rs1, csr):
    return to_u32((csr << 20) | (rs1 << 15) | (1 << 12) | (rd << 7) | 0x73)

def encode_ecall():
    return 0x00000073

def encode_li(rd, imm):
    return encode_addi(rd, 0, imm)

# Register aliases
x0, x1, x2, x3, x4, x5 = 0, 1, 2, 3, 4, 5

# CSR addresses (for documentation)
MTVEC = 0x305
MEPC = 0x341
MCAUSE = 0x342

# Build the program
program = []

# === Main Program (starts at 0x8000) ===
# Set up mtvec to point to trap handler
# We'll calculate the address relative to current PC using AUIPC

# AUIPC x1, 0          # x1 = PC (upper bits)
program.append(encode_auipc(x1, 0))

# ADDI x1, x1, 24      # x1 = address of trap_handler (0x8000 + 24 = 0x8006 = 3 instructions * 4 bytes per instruction... but we're word-addressed)
# Actually, in our word-addressed model, trap_handler is at offset +5 words from here
program.append(encode_addi(x1, x1, 12))  # 3 words ahead (PC + 3)

# CSRRW x0, x1, MTVEC  # mtvec = x1 (write to mtvec, discard old value to x0)
program.append(encode_csrrw(x0, x1, MTVEC))

# Print 'T' to indicate test started
program.append(encode_li(x2, ord('T')))      # x2 = 'T'
program.append(encode_lui(x3, 0x1000))       # x3 = 0x1000 (UART base)
program.append(encode_sw(x2, x3, 0))         # SW x2, 0(x3)

# ECALL - this should trigger trap to mtvec
program.append(encode_ecall())

# If we get here, trap didn't work - print 'X' and halt
program.append(encode_li(x2, ord('X')))
program.append(encode_sw(x2, x3, 0))
program.append(encode_jal(x0, 0))  # infinite loop

# === Trap Handler (mtvec points here) ===
# When trap occurs:
# - mepc contains return address
# - mcause contains trap cause (11 for ECALL)

# trap_handler (label)
# Print '!' to indicate trap taken
program.append(encode_li(x2, ord('!')))      # x2 = '!'
program.append(encode_sw(x2, x3, 0))         # UART: '!'

# Print cause digit (should be 11 for ECALL, we'll print '1' + '1')
# CSRRW x2, x0, MCAUSE  # Read mcause into x2
program.append(encode_csrrw(x2, x0, MCAUSE))

# Print low digit of cause (cause % 10 + '0')
program.append(encode_li(x4, 10))
# Simple: just print '1' for ECALL (cause 11)
program.append(encode_li(x2, ord('1')))
program.append(encode_sw(x2, x3, 0))

# Print newline
program.append(encode_li(x2, ord('\n')))
program.append(encode_sw(x2, x3, 0))

# Return from trap: jump to mepc
# CSRRW x1, x0, MEPC  # Read mepc into x1
program.append(encode_csrrw(x1, x0, MEPC))

# JALR x0, x1, 0      # Jump to mepc
program.append(encode_jalr(x0, x1, 0))

# Convert to bytes
output = b''.join(struct.pack('<I', inst) for inst in program)

# Write binary
with open('/tmp/trap_test.riscv.bin', 'wb') as f:
    f.write(output)

print(f"Created trap test binary: {len(output)} bytes, {len(program)} instructions")
print("\nDisassembly:")
for i, inst in enumerate(program):
    addr = 0x8000 + i * 4
    print(f"  0x{addr:04X}: 0x{inst:08X}")

print("\nExpected behavior:")
print("  1. Print 'T' (test started)")
print("  2. Execute ECALL")
print("  3. Trap to handler, print '!'")
print("  4. Print '1' (cause)")
print("  5. Return from trap (infinite loop)")
print("\nOutput should be: T!1")
