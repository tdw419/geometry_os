"""
Visual Linker - Links .rts.png programs via texture sampling
Implements the Visual ABI for function exports/imports
"""

import numpy as np
from dataclasses import dataclass
from typing import Dict, List
import hashlib
import zlib

@dataclass
class ExportedFunction:
    name: str
    address: int
    hash: int

class VisualLinker:
    def __init__(self):
        self.exports: Dict[str, ExportedFunction] = {}

    def _hash_function_name(self, name: str) -> int:
        """CRC32 hash of function name for visual ABI"""
        return zlib.crc32(name.encode()) & 0xFFFF

    def extract_exports(self, png_path: str) -> Dict[str, int]:
        """
        Extract exported functions from Visual ABI header
        Top-left 64x64 region contains function table
        """
        try:
            from PIL import Image
            img = Image.open(png_path).convert('RGBA')
            pixels = np.array(img)
        except ImportError:
            raise ImportError("PIL/Pillow required")

        # Get actual image dimensions
        height, width = pixels.shape[:2]

        # Read function table from Row 0 (up to 64 entries or image width)
        functions = {}
        max_entries = min(64, width)
        for i in range(max_entries):
            r, g, b, a = pixels[0, i]

            # Check for empty slot (all zeros)
            if r == 0 and g == 0 and b == 0 and a == 0:
                break

            # Decode: RG = function hash, BA = address
            func_hash = (r << 8) | g
            address = (b << 8) | a

            # For now, use address as key (real impl would reverse hash)
            functions[f"func_{address}"] = address

        return functions

    def write_exports(self, pixels: np.ndarray, exports: List[tuple]) -> np.ndarray:
        """
        Write function exports to Visual ABI header
        exports: List of (name, address) tuples
        """
        # Ensure pixels is writable
        pixels = pixels.copy()

        for i, (name, address) in enumerate(exports):
            if i >= 64:
                break

            # Encode: RG = function hash, BA = address
            func_hash = self._hash_function_name(name)
            r = (func_hash >> 8) & 0xFF
            g = func_hash & 0xFF
            b = (address >> 8) & 0xFF
            a = address & 0xFF

            pixels[0, i] = [r, g, b, a]

        return pixels

    def link(self, main_path: str, libraries: Dict[str, str]) -> 'LinkedProgram':
        """
        Link main program with library textures
        libraries: {name: path_to_png}
        """
        # Load main program
        from PIL import Image
        main_img = Image.open(main_path).convert('RGBA')
        main_pixels = np.array(main_img)

        # Collect all texture slots
        texture_slots = {}
        slot_index = 0

        for lib_name, lib_path in libraries.items():
            lib_img = Image.open(lib_path).convert('RGBA')
            lib_pixels = np.array(lib_img)

            # Store texture reference
            texture_slots[slot_index] = {
                'name': lib_name,
                'path': lib_path,
                'pixels': lib_pixels,
                'exports': self.extract_exports(lib_path)
            }
            slot_index += 1

        return LinkedProgram(
            pixels=main_pixels,
            texture_slots=texture_slots,
            metadata={'texture_count': len(texture_slots)}
        )

@dataclass
class LinkedProgram:
    pixels: np.ndarray
    texture_slots: Dict[int, Dict]
    metadata: Dict
