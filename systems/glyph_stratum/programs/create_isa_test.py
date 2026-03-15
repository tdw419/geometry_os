#!/usr/bin/env python3
import numpy as np
from PIL import Image
import struct

def addr_to_xy(d):
    """Simple linear-to-2D for the 4096 substrate (first block)."""
    return d % 4096, d // 4096

# 1. Load the compiled emulator
emu_img = Image.open('/tmp/riscv_mini_fixed.rts.png').convert('RGBA')
emu_data = np.array(emu_img)

# 2. Create substrate
substrate = np.zeros((4096, 4096, 4), dtype=np.uint8)

# 3. Inject Emulator at 0x0000
# (Copy the non-zero pixels from emu_data to substrate)
for y in range(emu_data.shape[0]):
    for x in range(emu_data.shape[1]):
        if np.any(emu_data[y, x] > 0):
            substrate[y, x] = emu_data[y, x]

# 4. Create ISA Verification Guest Program (RISC-V)
# We test: LUI (0x37), AUIPC (0x17), and Register-Store (0x23)
guest_code = [
    0x000470B7, # LUI x1, 0x47      (x1 = 'G' << 12? No, LUI loads top 20 bits. Let's use 0x47)
    0x00000117, # AUIPC x2, 0       (x2 = current PC = 0x18001)
    0x00112023, # SW x1, 0(x2)      (Write value of x1 to memory at x2)
    0x00100073  # EBREAK            (Halt)
]

# 5. Inject Guest at 0x18000
guest_base = 0x18000
for i, instr in enumerate(guest_code):
    x, y = addr_to_xy(guest_base + i)
    b = struct.pack('<I', instr)
    substrate[y, x] = [b[0], b[1], b[2], b[3]]

# 6. Save and load
Image.fromarray(substrate).save('/tmp/isa_verify.rts.png')
print("Substrate saved to /tmp/isa_verify.rts.png")
print("Verified Guest Entry: 0x18000")
