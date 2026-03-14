import numpy as np
from PIL import Image
import sys
import os
import hashlib
import json

# Geometry OS - Phase 44 Spatial Re-Linker
# Converts RISC-V 64-bit to Executable Geometric Bricks

OP_NOP = 0x00
OP_MOV = 0x01
OP_LDI = 0x08
OP_LOAD = 0x03
OP_STORE = 0x04
OP_ADD = 0x33
OP_SUB = 0x34
OP_MUL = 0x35
OP_DIV = 0x36
OP_JMP = 0x06
OP_HALT = 0x07
OP_DATA = 0x09

class HilbertCurve:
    def __init__(self, order):
        self.order = order
        self.grid_size = 2 ** order

    def d_to_xy(self, d):
        x, y = 0, 0
        s = 1
        t = d
        while s < self.grid_size:
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

class RISCVToGeometricJIT:
    def __init__(self, input_path, output_path, warp_size=32, zone_order=[0,1,2,3], dense=False):
        self.input_path = input_path
        self.output_path = output_path
        self.warp_size = int(warp_size)
        self.zone_order = zone_order
        self.dense = dense
        self.data = None
        self.grid_size = 0
        self.order = 0

    def load_binary(self):
        with open(self.input_path, 'rb') as f:
            self.data = f.read()
        num_instructions = (len(self.data) + 3) // 4
        self.order = int(np.ceil(np.log2(np.sqrt(num_instructions))))
        self.grid_size = 2 ** self.order

    def decode_and_map(self):
        pixels = np.zeros((self.grid_size, self.grid_size, 4), dtype=np.uint8)
        hilbert = HilbertCurve(self.order)
        num_inst = len(self.data) // 4
        
        # Address Map: Logical Index -> Physical Hilbert Index
        logical_to_physical = {}
        silos = [[] for _ in range(4)]
        
        print("  Pass 1: Address Mapping & Siloing...")
        for i in range(0, len(self.data), 4):
            chunk = self.data[i:i+4].ljust(4, b'\x00')
            inst_val = int.from_bytes(chunk, 'little')
            opcode = inst_val & 0x7F
            
            # Determine Zone
            zone_idx = 3
            if opcode == 0x33 or opcode == 0x13: zone_idx = 0 # ALU/IMM
            elif opcode in [0x03, 0x23]: zone_idx = 1 # MEM
            elif opcode in [0x6F, 0x67, 0x63]: zone_idx = 2 # CTRL
            
            logical_idx = i // 4
            silos[zone_idx].append(logical_idx)

        # Calculate Physical Offsets
        WARP_SIZE = self.warp_size
        current_phys = 0
        
        if self.dense:
            # Flatten all silos into a single stream, preserving zone order
            for zone_idx in self.zone_order:
                for logical_idx in silos[zone_idx]:
                    logical_to_physical[logical_idx] = current_phys
                    current_phys += 1
        else:
            # Hierarchical Strategy (Original)
            BLOCK_SIZE = 4096
            silo_ptrs = [0] * len(silos)
            while any(silo_ptrs[j] < len(silos[j]) for j in range(len(silos))):
                for zone_idx in self.zone_order:
                    for _ in range(BLOCK_SIZE // WARP_SIZE):
                        for __ in range(WARP_SIZE):
                            if silo_ptrs[zone_idx] < len(silos[zone_idx]):
                                logical_to_physical[silos[zone_idx][silo_ptrs[zone_idx]]] = current_phys
                                current_phys += 1
                                silo_ptrs[zone_idx] += 1
                        if current_phys % WARP_SIZE != 0:
                            current_phys += (WARP_SIZE - (current_phys % WARP_SIZE))

        print("  Pass 2: Semantic Translation & Static Relinking...")
        for i in range(0, len(self.data), 4):
            chunk = self.data[i:i+4].ljust(4, b'\x00')
            inst_val = int.from_bytes(chunk, 'little')
            opcode_riscv = inst_val & 0x7F
            
            rd = (inst_val >> 7) & 0x1F
            rs1 = (inst_val >> 15) & 0x1F
            rs2 = (inst_val >> 20) & 0x1F
            
            op_geo = OP_NOP
            r1, r2, out_rd = rs1, rs2, rd
            
            # Patch Jump/Branch Targets
            if opcode_riscv == 0x6F: # JAL
                op_geo = OP_JMP
                # Simplified: target is PC + immediate
                # In a real relinker, we'd parse the complex RISC-V immediate
                # For this JIT, we treat rs1 as the new physical target
                # (Patching the register file during execution is handled by shader)
                pass 
            elif opcode_riscv == 0x33: # ALU
                op_geo = OP_ADD # Simplified
            elif opcode_riscv == 0x13: # IMM
                op_geo = OP_LDI
                r1 = (inst_val >> 20) & 0xFF
            elif opcode_riscv == 0x03: op_geo = OP_LOAD
            elif opcode_riscv == 0x23: op_geo = OP_STORE

            # Final physical placement
            logical_idx = i // 4
            phys_idx = logical_to_physical[logical_idx]
            x, y = hilbert.d_to_xy(phys_idx)
            pixels[y, x] = [op_geo, r1, r2, out_rd]

        return pixels

    def run(self):
        self.load_binary()
        print(f"Crystallizing {len(self.data)} bytes...")
        pixels = self.decode_and_map()
        Image.fromarray(pixels, 'RGBA').save(self.output_path)
        print(f"✅ Executable Spatial Linux: {self.output_path}")

if __name__ == "__main__":
    import sys
    warp = 32
    order = [0,1,2,3]
    dense = False
    
    if "--dense" in sys.argv:
        dense = True
        sys.argv.remove("--dense")
        
    if len(sys.argv) > 3:
        warp = int(sys.argv[3])
    if len(sys.argv) > 4:
        order = [int(x) for x in sys.argv[4].split(",")]
        
    jit = RISCVToGeometricJIT(sys.argv[1], sys.argv[2], warp_size=warp, zone_order=order, dense=dense)
    jit.run()
