#!/usr/bin/env python3
"""
Geometry OS - OpenSBI Bridge
Converts OpenSBI firmware + Linux kernel into a unified Geometric Brick
with native SBI console output support.

Boot Sequence:
  OpenSBI (M-Mode) → Linux Kernel (S-Mode) → Userspace

The bridge patches SBI console calls to output via our Visual Bridge.
"""

import numpy as np
from pathlib import Path
import struct
import json

# SBI Extension IDs
SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x01
SBI_EXT_0_1_CONSOLE_GETCHAR = 0x02
SBI_EXT_BASE = 0x10

# Geometric VM Opcodes
OP_NOP = 0x00
OP_MOV = 0x01
OP_LDI = 0x08
OP_LOAD = 0x03
OP_STORE = 0x04
OP_ADD = 0x33
OP_SUB = 0x34
OP_ECALL = 0x73  # Environment call (SBI)
OP_HALT = 0x07
OP_DEBUG = 0x0F  # Custom: output to console

class HilbertCurve:
    """Space-filling Hilbert curve for 1D→2D mapping."""
    def __init__(self, order):
        self.order = order
        self.size = 2 ** order

    def d_to_xy(self, d):
        x = y = 0
        s = 1
        t = d
        while s < self.size:
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


class OpenSBIBridge:
    """
    Bridges OpenSBI firmware with Geometry OS execution.

    The bridge:
    1. Loads OpenSBI firmware (fw_dynamic.bin)
    2. Patches SBI console calls to use our Visual Bridge
    3. Chains to the Linux kernel at the proper address
    """

    def __init__(self, opensbi_path: str, kernel_path: str, output_path: str):
        self.opensbi_path = Path(opensbi_path)
        self.kernel_path = Path(kernel_path)
        self.output_path = Path(output_path)

        # Load firmware
        with open(self.opensbi_path, 'rb') as f:
            self.opensbi_data = f.read()

        # Load kernel
        with open(self.kernel_path, 'rb') as f:
            self.kernel_data = f.read()

        # Calculate grid size (power of 2)
        total_bytes = len(self.opensbi_data) + len(self.kernel_data)
        total_inst = (total_bytes + 3) // 4
        self.order = int(np.ceil(np.log2(np.sqrt(total_inst)))) + 1
        self.grid_size = 2 ** self.order

        # Address map
        self.opensbi_base = 0x80000000  # Standard RISC-V boot address
        self.kernel_base = 0x80200000  # Linux kernel load address

        print(f"OpenSBI Bridge Configuration:")
        print(f"  Firmware: {len(self.opensbi_data):,} bytes")
        print(f"  Kernel: {len(self.kernel_data):,} bytes")
        print(f"  Grid: {self.grid_size}x{self.grid_size}")

    def build(self):
        """
        Build the unified Geometric Brick with OpenSBI + Kernel.

        Layout in texture:
        - Region 0 (0x80000000): OpenSBI firmware
        - Region 1 (0x80200000): Linux kernel
        - SBI console patches applied
        """
        pixels = np.zeros((self.grid_size, self.grid_size, 4), dtype=np.uint8)
        hilbert = HilbertCurve(self.order)

        print("\n  Pass 1: Loading OpenSBI firmware...")
        phys_idx = 0

        # Copy OpenSBI to texture
        for i in range(0, len(self.opensbi_data), 4):
            chunk = self.opensbi_data[i:i+4].ljust(4, b'\x00')
            inst = int.from_bytes(chunk, 'little')

            # Check for ECALL (SBI call)
            opcode = inst & 0x7F
            if opcode == 0x73:  # ECALL
                # Mark as debug output for console
                op = OP_DEBUG
            else:
                op = self._riscv_to_geo(inst)

            rd = (inst >> 7) & 0x1F
            rs1 = (inst >> 15) & 0x1F
            rs2 = (inst >> 20) & 0x1F

            x, y = hilbert.d_to_xy(phys_idx)
            if x < self.grid_size and y < self.grid_size:
                pixels[y, x] = [op, rd, rs1, rs2]
            phys_idx += 1

        opensbi_end = phys_idx
        print(f"    OpenSBI ends at Hilbert index {opensbi_end:,}")

        print("\n  Pass 2: Loading Linux kernel...")
        # Align kernel to next warp boundary
        WARP_SIZE = 32
        if phys_idx % WARP_SIZE != 0:
            phys_idx += (WARP_SIZE - (phys_idx % WARP_SIZE))

        kernel_start = phys_idx

        for i in range(0, len(self.kernel_data), 4):
            chunk = self.kernel_data[i:i+4].ljust(4, b'\x00')
            inst = int.from_bytes(chunk, 'little')

            opcode = inst & 0x7F
            if opcode == 0x73:  # ECALL
                op = OP_DEBUG
            else:
                op = self._riscv_to_geo(inst)

            rd = (inst >> 7) & 0x1F
            rs1 = (inst >> 15) & 0x1F
            rs2 = (inst >> 20) & 0x1F

            x, y = hilbert.d_to_xy(phys_idx)
            if x < self.grid_size and y < self.grid_size:
                pixels[y, x] = [op, rd, rs1, rs2]
            phys_idx += 1

        print(f"    Kernel starts at Hilbert index {kernel_start:,}")
        print(f"    Total instructions: {phys_idx:,}")

        # Save as PNG
        from PIL import Image
        img = Image.fromarray(pixels, mode='RGBA')
        img.save(self.output_path)

        # Generate manifest
        manifest = {
            "opensbi_base": hex(self.opensbi_base),
            "kernel_base": hex(self.kernel_base),
            "opensbi_hilbert_start": 0,
            "opensbi_hilbert_end": opensbi_end,
            "kernel_hilbert_start": kernel_start,
            "grid_size": self.grid_size,
            "total_instructions": phys_idx,
            "sbi_console_enabled": True
        }

        manifest_path = self.output_path.with_suffix('.manifest.json')
        with open(manifest_path, 'w') as f:
            json.dump(manifest, f, indent=2)

        print(f"\n  ✓ Saved: {self.output_path}")
        print(f"  ✓ Manifest: {manifest_path}")

        return pixels

    def _riscv_to_geo(self, inst):
        """Convert RISC-V instruction to Geometric VM opcode."""
        opcode = inst & 0x7F
        funct3 = (inst >> 12) & 0x07
        funct7 = (inst >> 25) & 0x7F

        if opcode == 0x33:  # R-type ALU
            if funct3 == 0x00:
                return OP_SUB if funct7 == 0x20 else OP_ADD
            elif funct3 == 0x01:
                return 0x35  # MUL
            elif funct3 == 0x04:
                return 0x37  # XOR
            elif funct3 == 0x06:
                return 0x38  # OR
            elif funct3 == 0x07:
                return 0x39  # AND
        elif opcode == 0x13:  # I-type ALU
            if funct3 == 0x00:
                return 0x3A  # ADDI
            return OP_LDI
        elif opcode == 0x03:  # LOAD
            return OP_LOAD
        elif opcode == 0x23:  # STORE
            return OP_STORE
        elif opcode == 0x6F:  # JAL
            return 0x06  # JMP
        elif opcode == 0x67:  # JALR
            return 0x06
        elif opcode == 0x63:  # BRANCH
            return 0x06
        elif opcode == 0x37:  # LUI
            return OP_LDI
        elif opcode == 0x17:  # AUIPC
            return OP_LDI

        return OP_NOP


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 4:
        print("Usage: python opensbi_bridge.py <opensbi.bin> <kernel> <output.rts.png>")
        print()
        print("Example:")
        print("  python opensbi_bridge.py \\")
        print("    /usr/share/qemu/opensbi-riscv64-generic-fw_dynamic.bin \\")
        print("    systems/ubuntu_riscv/vmlinux \\")
        print("    systems/ubuntu_riscv/ubuntu_opensbi.rts.png")
        sys.exit(1)

    bridge = OpenSBIBridge(sys.argv[1], sys.argv[2], sys.argv[3])
    bridge.build()
