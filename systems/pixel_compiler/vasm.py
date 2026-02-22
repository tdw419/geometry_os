#!/usr/bin/env python3
"""
Visual Assembly (VASM) Compiler: ASCII → PixelRTS

This tool is the actuation mechanism for AI Agents in Geometry OS.
It converts "Visual Assembly" (standard RISC-V assembly + directives)
into bootable PixelRTS v2 containers (.rts.png).

The AI workflow:
1. Perceive: Read `riscv_core.ascii` (Scene Graph).
2. Reason: Decide to patch code or spawn a new process.
3. Act: Generate `patch.vasm`.
4. Materialize: Run `vasm.py` -> `patch.rts.png`.

Usage:
    python3 vasm.py build hello.vasm hello.rts.png
"""

import sys
import os
import struct
import subprocess
import tempfile
import json
import math
import numpy as np
from PIL import Image, PngImagePlugin
from pathlib import Path

# Increase PIL limit
Image.MAX_IMAGE_PIXELS = None

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

# Import Hilbert LUT from existing converter (if available, otherwise reimplement)
try:
    from systems.neural_substrate.llm_pixelrts_converter import HilbertLUT
except ImportError:
    # Reimplement Hilbert LUT for independence
    class HilbertLUT:
        _cache = {}
        @staticmethod
        def _hilbert_d2xy(n, d):
            x, y = 0, 0
            s = 1
            while s < n:
                rx = 1 & (d // 2)
                ry = 1 & (d ^ rx)
                if ry == 0:
                    if rx == 1:
                        x = s - 1 - x
                        y = s - 1 - y
                    x, y = y, x
                x += s * rx
                y += s * ry
                d //= 4
                s *= 2
            return int(x), int(y)
        
        @classmethod
        def get_lut(cls, order):
            if order in cls._cache: return cls._cache[order]
            grid_size = 2 ** order
            total = grid_size * grid_size
            lut = np.zeros((total, 2), dtype=np.uint32)
            for d in range(total):
                x, y = cls._hilbert_d2xy(grid_size, d)
                lut[d] = [x, y]
            cls._cache[order] = lut
            return lut

class VisualAssembler:
    def __init__(self):
        self.temp_dir = Path(tempfile.mkdtemp(prefix="vasm_"))
        print(f"[*] Visual Assembler initialized in {self.temp_dir}")

    def assemble(self, vasm_path: Path) -> bytes:
        """Assemble VASM file to flat binary"""
        # 1. Preprocess (extract directives, clean assembly)
        asm_lines = []
        entry_point = 0x80000000
        
        with open(vasm_path, 'r') as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith('#'): continue
                
                if line.startswith('@ENTRY'):
                    try:
                        entry_point = int(line.split()[1], 16)
                    except ValueError:
                        print(f"⚠️  Invalid @ENTRY directive: {line}")
                    continue
                
                asm_lines.append(line)
        
        asm_content = "\n".join(asm_lines)
        asm_file = self.temp_dir / "temp.s"
        obj_file = self.temp_dir / "temp.o"
        elf_file = self.temp_dir / "temp.elf"
        bin_file = self.temp_dir / "temp.bin"
        
        with open(asm_file, 'w') as f:
            f.write(".section .text\n")
            f.write(".globl _start\n")
            f.write("_start:\n")
            f.write(asm_content)
            f.write("\n")
        
        # 2. Assemble (using system toolchain)
        try:
            subprocess.run(
                ["riscv64-linux-gnu-as", "-march=rv32ima", "-mabi=ilp32", "-o", str(obj_file), str(asm_file)],
                check=True, capture_output=True
            )
        except subprocess.CalledProcessError as e:
            print(f"❌ Assembler failed:\n{e.stderr.decode()}")
            raise

        # 3. Link (to resolve addresses)
        try:
            # Link .text to entry point (0x80000000 by default)
            # Use -Ttext to set start address
            subprocess.run(
                ["riscv64-linux-gnu-ld", "-m", "elf32lriscv", "-Ttext", hex(entry_point), "-o", str(elf_file), str(obj_file)],
                check=True, capture_output=True
            )
        except subprocess.CalledProcessError as e:
            print(f"❌ Linker failed:\n{e.stderr.decode()}")
            raise
        
        # 4. Extract to flat binary
        try:
            # Extract all loadable sections
            subprocess.run(
                ["riscv64-linux-gnu-objcopy", "-O", "binary", str(elf_file), str(bin_file)],
                check=True
            )
        except subprocess.CalledProcessError as e:
            print(f"❌ Objcopy failed:\n{e.stderr.decode()}")
            raise
            
        with open(bin_file, 'rb') as f:
            binary = f.read()
            
        return binary, entry_point

    def binary_to_rts(self, binary: bytes, entry_point: int, output_path: Path):
        """Convert binary to PixelRTS PNG"""
        # Calculate grid size
        pixels_needed = (len(binary) + 3) // 4
        order = max(4, math.ceil(math.log2(math.sqrt(pixels_needed)))) # Min 16x16
        grid_size = 2 ** order
        total_pixels = grid_size * grid_size
        
        print(f"[*] Packing {len(binary)} bytes into {grid_size}x{grid_size} grid (Order {order})")
        
        # Pad binary
        padded_len = total_pixels * 4
        if len(binary) < padded_len:
            binary += b'\x00' * (padded_len - len(binary))
            
        # Pack to RGBA using Hilbert Curve
        lut = HilbertLUT.get_lut(order)
        img_data = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
        
        for i in range(total_pixels):
            x, y = lut[i]
            offset = i * 4
            img_data[y, x] = [
                binary[offset],
                binary[offset+1],
                binary[offset+2],
                binary[offset+3]
            ]
            
        # Save
        img = Image.fromarray(img_data, 'RGBA')
        
        metadata = {
            "format": "PixelRTS-2.0-VASM",
            "entry_point": entry_point,
            "grid_size": grid_size,
            "bytes": len(binary)
        }
        
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", json.dumps(metadata))
        
        img.save(output_path, pnginfo=pnginfo)
        
        # Save sidecar metadata for Rust loader compatibility
        meta_path = output_path.with_suffix(".meta.json")
        # Ensure we don't end up with .rts.meta.json.meta.json if input was .rts.png
        if str(output_path).endswith(".rts.png"):
             meta_path = Path(str(output_path).replace(".rts.png", ".rts.meta.json"))
             
        with open(meta_path, 'w') as f:
            # Match the struct ProgramMetadata in Rust
            rust_metadata = {
                "format": "PixelRTS-2.0-VASM",
                "version": "2.0",
                "architecture": "riscv32",
                "grid_size": grid_size,
                "hilbert_order": order,
                "code_size": len(binary) // 4,
                "entry_point": hex(entry_point)
            }
            json.dump(rust_metadata, f, indent=2)
            
        print(f"✅ Saved PixelRTS container to {output_path}")
        print(f"✅ Saved Metadata to {meta_path}")

def main():
    if len(sys.argv) < 3:
        print("Usage: python3 vasm.py build <input.vasm> <output.rts.png>")
        sys.exit(1)
        
    cmd = sys.argv[1]
    if cmd == "build":
        vasm_path = Path(sys.argv[2])
        out_path = Path(sys.argv[3])
        
        assembler = VisualAssembler()
        try:
            binary, entry = assembler.assemble(vasm_path)
            assembler.binary_to_rts(binary, entry, out_path)
        except Exception as e:
            print(f"❌ Build failed: {e}")
            sys.exit(1)

if __name__ == "__main__":
    main()
