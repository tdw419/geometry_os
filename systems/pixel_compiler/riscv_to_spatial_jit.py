import numpy as np
from PIL import Image
import sys
import os
import hashlib
import json

# Geometry OS - Phase 43/44 Spatial JIT
# Mapping RISC-V 64-bit binaries to 2D Spatial Glyphs

# Opcode Mapping from glyph_vm.wgsl
OP_DATA = 0.0    # Blue Sector 0.0 - 0.2
OP_CALL = 0.2    # Blue Sector 0.2 - 0.4
OP_LOAD = 0.4    # Blue Sector 0.4 - 0.6
OP_STORE = 0.6   # Blue Sector 0.6 - 0.8
OP_NOP = 0.8     # Blue Sector 0.8 - 1.0

class HilbertCurve:
    def __init__(self, order):
        self.order = order
        self.grid_size = 2 ** order

    def d_to_xy(self, d):
        """Convert 1D index to 2D Hilbert coordinates."""
        x, y = 0, 0
        s = 1
        t = d
        while s < self.grid_size:
            rx = 1 & (t // 2)
            ry = 1 & (t ^ rx)
            x, y = self._rotate(s, x, y, rx, ry)
            x += s * rx
            y += s * ry
            t //= 4
            s *= 2
        return x, y

    def _rotate(self, n, x, y, rx, ry):
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            return y, x
        return x, y

class RISCVToSpatialJIT:
    def __init__(self, input_path, output_path):
        self.input_path = input_path
        self.output_path = output_path
        self.data = None
        self.grid_size = 0
        self.order = 0

    def load_binary(self):
        with open(self.input_path, 'rb') as f:
            self.data = f.read()
        
        # Calculate grid size (power of 2)
        # Each pixel represents 4 bytes (one RISC-V instruction)
        num_instructions = (len(self.data) + 3) // 4
        self.order = int(np.ceil(np.log2(np.sqrt(num_instructions))))
        self.grid_size = 2 ** self.order
        print(f"Binary Size: {len(self.data)} bytes")
        print(f"Instructions: {num_instructions}")
        print(f"Spatial Grid: {self.grid_size}x{self.grid_size} (Order {self.order})")

    def decode_and_map(self):
        # Initialize RGBA float32 array
        pixels = np.zeros((self.grid_size, self.grid_size, 4), dtype=np.float32)
        hilbert = HilbertCurve(self.order)

        # Iterate through instructions
        for i in range(0, len(self.data), 4):
            chunk = self.data[i:i+4]
            if len(chunk) < 4:
                chunk = chunk.ljust(4, b'\x00')
            
            # Decode RISC-V Opcode (lower 7 bits)
            inst_val = int.from_bytes(chunk, 'little')
            opcode = inst_val & 0x7F
            
            # Semantic Mapping
            # Simplified RISC-V decoding for the JIT Lens
            r_val = (inst_val >> 7) / 0xFFFFFFFF # Activation/Entropy from the rest of instruction
            g_val = 0.0
            b_val = OP_NOP
            
            # RISC-V Opcode Families
            if opcode == 0x03: # LOAD
                b_val = OP_LOAD
            elif opcode == 0x23: # STORE
                b_val = OP_STORE
            elif opcode in [0x13, 0x1B, 0x33, 0x3B, 0x63, 0x67, 0x6F]: # Arithmetic/Branch/Jump
                b_val = OP_CALL
            elif opcode in [0x37, 0x17]: # LUI, AUIPC (DATA-like)
                b_val = OP_DATA
            
            # Map to 2D Hilbert space
            inst_idx = i // 4
            x, y = hilbert.d_to_xy(inst_idx)
            
            pixels[y, x] = [r_val, g_val, b_val, 1.0]

        return pixels

    def run(self):
        self.load_binary()
        print("Crystallizing to Spatial Substrate (Hilbert)...")
        pixels = self.decode_and_map()
        
        # Convert to uint8 for PNG
        img_data = (pixels * 255).astype(np.uint8)
        img = Image.fromarray(img_data, 'RGBA')
        img.save(self.output_path)
        
        # Save Metadata
        meta = {
            "format": "PixelRTS-2.0-Spatial",
            "name": os.path.basename(self.input_path),
            "sha256": hashlib.sha256(self.data).hexdigest(),
            "grid_size": self.grid_size,
            "order": self.order,
            "instruction_count": (len(self.data) + 3) // 4
        }
        with open(self.output_path + ".meta.json", 'w') as f:
            json.dump(meta, f, indent=2)
            
        print(f"✅ Crystallized Spatial Linux: {self.output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 riscv_to_spatial_jit.py <input_riscv> <output_spatial.rts.png>")
        sys.exit(1)
        
    jit = RISCVToSpatialJIT(sys.argv[1], sys.argv[2])
    jit.run()
