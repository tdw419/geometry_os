#!/usr/bin/env python3
"""
RISC-V Resonance Encoder (Holographic Edition)
Encodes RISC-V binaries into 16x16 Holographic Resonance Glyphs.

The resulting .rts.png is a "Visual Motherboard" where:
- Instructions are encoded as 2D Hadamard interference patterns.
- Morphological shapes provide a Geometric Audit (symmetry check).
- GPU executes directly from the texture via holographic decoding.

"The Screen is the Hard Drive. The Code is the Perception."
"""

import sys
import struct
import argparse
import numpy as np
from pathlib import Path
from PIL import Image

# Add systems to path for core imports
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent / "systems/intelligence/geometric_text"))

# Import the font system for Morphological Shapes
try:
    from universal_font_demo import UniversalMorphologicalFont
    FONT_AVAILABLE = True
except ImportError:
    FONT_AVAILABLE = False

def hadamard_sign(i, j):
    """Matches the WGSL countOneBits(i & j) % 2 logic."""
    p = bin(i & j).count('1')
    return 1 if p % 2 == 0 else -1

class RISCVResonanceEncoder:
    def __init__(self, glyph_size=16):
        self.glyph_size = glyph_size
        if FONT_AVAILABLE:
            self.font = UniversalMorphologicalFont()
        else:
            self.font = None
            
        # Precompute Hadamard Basis for 32 bits
        self.basis = []
        for k in range(32):
            row_k = (k // 8) + 1
            col_k = (k % 8) + 1
            
            pattern = np.zeros((glyph_size, glyph_size))
            for i in range(glyph_size):
                for j in range(glyph_size):
                    pattern[i, j] = hadamard_sign(i, row_k) * hadamard_sign(j, col_k)
            self.basis.append(pattern)
        
        # Opcode to Morphological Char mapping
        self.type_mapping = {
            0x37: 'U', 0x17: 'A', 0x6F: 'J', 0x67: 'R',
            0x63: 'B', 0x03: 'L', 0x23: 'S', 0x13: 'i',
            0x33: 'a', 0x0F: 'F', 0x73: '!', 0x00: '?'
        }

    def encode_instruction(self, inst_u32):
        """
        Creates a 16x16 holographic pattern for a 32-bit instruction.
        """
        # Start with neutral 0.5 (mapped to 128 in uint8)
        grid = np.zeros((self.glyph_size, self.glyph_size))
        
        # Holographic Superposition
        # We use a small weight for each basis to keep the sum within range
        weight = 0.5 / 32.0 
        
        for k in range(32):
            if (inst_u32 >> k) & 1:
                grid += weight * self.basis[k]
            else:
                grid -= weight * self.basis[k]
        
        # Shift and scale to [0, 1]
        grid = (grid + 0.5).clip(0, 1)
        return (grid * 255.0).astype(np.uint8)

    def get_morph_shape(self, inst_u32):
        """Get 16x16 alpha mask from Morphological Font."""
        opcode = inst_u32 & 0x7F
        char = self.type_mapping.get(opcode, '?')
        
        if self.font:
            pixels = self.font.generate_sequence(char)
            # Convert Hilbert 1D to 2D
            mask = np.zeros((self.glyph_size, self.glyph_size), dtype=np.uint8)
            for d in range(self.glyph_size * self.glyph_size):
                x, y = self.font.hilbert.d2xy(d)
                mask[y, x] = int(np.clip(pixels[d], 0, 255))
            return mask
        else:
            # Fallback to simple circle/square if font unavailable
            return np.ones((self.glyph_size, self.glyph_size), dtype=np.uint8) * 255

    def encode_binary(self, input_path, output_path):
        with open(input_path, 'rb') as f:
            data = f.read()
            
        # Pad to 4 bytes
        if len(data) % 4 != 0:
            data += b'\x00' * (4 - (len(data) % 4))
            
        num_instr = len(data) // 4
        grid_dim = int(np.ceil(np.sqrt(num_instr)))
        tex_size = grid_dim * self.glyph_size
        
        print(f"[*] Encoding {num_instr} instructions into {tex_size}x{tex_size} resonance texture...")
        
        canvas = np.zeros((tex_size, tex_size, 4), dtype=np.uint8)
        
        for i in range(num_instr):
            offset = i * 4
            instr = struct.unpack("<I", data[offset:offset+4])[0]
            
            # 1. Generate Holographic Pattern (RGB)
            pattern = self.encode_instruction(instr)
            
            # 2. Generate Morphological Shape (Alpha)
            mask = self.get_morph_shape(instr)
            
            # 3. Layout in 2D
            gx = (i % grid_dim) * self.glyph_size
            gy = (i // grid_dim) * self.glyph_size
            
            # Apply to canvas
            for c in range(3): # RGB
                canvas[gy:gy+16, gx:gx+16, c] = pattern
            canvas[gy:gy+16, gx:gx+16, 3] = mask # Alpha
            
        img = Image.fromarray(canvas, mode='RGBA')
        img.save(output_path)
        print(f"✅ Resonance Texture saved to {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="RISC-V Resonance Encoder")
    parser.add_argument("input", help="Input RISC-V binary")
    parser.add_argument("output", help="Output resonance texture (.rts.png)")
    args = parser.parse_args()
    
    encoder = RISCVResonanceEncoder()
    encoder.encode_binary(args.input, args.output)
