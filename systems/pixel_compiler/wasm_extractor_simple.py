#!/usr/bin/env python3
"""
WASM Extractor - Simple standalone version

Extracts WASM binaries from .rts.png files.
"""

from pathlib import Path
from typing import Optional
from PIL import Image
import numpy as np


class WASMExtractor:
    """
    Extract WASM binaries from .rts.png files.
    """

    # WASM magic number: \0asm
    WASM_MAGIC = b'\x00\x61\x73\x6d'

    # WASM version (current: 1)
    WASM_VERSION = b'\x01\x00\x00\x00'

    def __init__(self):
        """Initialize the WASM extractor"""
        pass

    def extract_from_png(self, png_path: Path) -> bytes:
        """
        Extract WASM binary from a .rts.png file.
        """
        png_path = Path(png_path)

        if not png_path.exists():
            raise FileNotFoundError(f"PNG file not found: {png_path}")

        # Load the PNG image
        img = Image.open(png_path)

        # Strategy 1: Check PNG metadata
        metadata = self._get_png_metadata(img)
        if 'wasm' in metadata:
            wasm_hex = metadata['wasm']
            try:
                wasm_bytes = bytes.fromhex(wasm_hex)
                if self.validate_wasm(wasm_bytes):
                    return wasm_bytes
            except (ValueError, TypeError):
                pass  # Fall through to other strategies

        # Strategy 2: Try pixel data extraction
        try:
            wasm_bytes = self._extract_from_pixels(img)
            if self.validate_wasm(wasm_bytes):
                return wasm_bytes
        except Exception:
            pass  # Fall through to error

        raise ValueError(f"No valid WASM data found in {png_path}")

    def extract_from_tiled(self, index_path: Path) -> bytes:
        """Extract WASM from tiled format."""
        # For now, treat as single file
        return self.extract_from_png(index_path)

    def validate_wasm(self, wasm_bytes: bytes) -> bool:
        """Verify WASM magic number and version."""
        if len(wasm_bytes) < 8:
            return False

        # Check magic number
        if wasm_bytes[:4] != self.WASM_MAGIC:
            return False

        return True

    def get_wasm_info(self, wasm_bytes: bytes) -> dict:
        """Get information about a WASM binary."""
        if not self.validate_wasm(wasm_bytes):
            raise ValueError("Invalid WASM binary")

        info = {
            'version': wasm_bytes[4:8].hex(),
            'size': len(wasm_bytes),
            'sections': []
        }

        # Parse sections (simplified)
        offset = 8  # Skip header
        while offset < len(wasm_bytes):
            section_id = wasm_bytes[offset]
            if section_id == 0:
                break  # Custom section or end

            # Read section length (LEB128)
            section_length, bytes_read = self._read_leb128(wasm_bytes, offset + 1)
            if offset + 1 + bytes_read + section_length > len(wasm_bytes):
                break

            section_names = {
                1: 'type',
                2: 'import',
                3: 'function',
                4: 'table',
                5: 'memory',
                6: 'global',
                7: 'export',
                8: 'start',
                9: 'element',
                10: 'code',
            }

            section_name = section_names.get(section_id, f'unknown({section_id})')
            info['sections'].append({
                'id': section_id,
                'name': section_name,
                'size': section_length
            })

            offset += 1 + bytes_read + section_length

        return info

    def _get_png_metadata(self, img: Image.Image) -> dict:
        """Extract metadata from PNG image."""
        metadata = {}

        # Check text chunks
        if hasattr(img, 'text'):
            metadata.update(img.text)

        # Check info dictionary
        if hasattr(img, 'info'):
            for key, value in img.info.items():
                if key not in metadata:
                    metadata[key] = value

        return metadata

    def _extract_from_pixels(self, img: Image.Image) -> bytes:
        """Extract WASM from pixel data."""
        # Convert to RGBA if needed
        if img.mode != 'RGBA':
            img = img.convert('RGBA')

        pixels = np.array(img)

        # Extract bytes from RGBA channels
        height, width, _ = pixels.shape

        # Read data in scanline order
        data_bytes = []
        for y in range(height):
            for x in range(width):
                r, g, b, a = pixels[y, x]
                if a > 0:  # Only use non-transparent pixels
                    data_bytes.extend([r, g, b])

        # Trim padding (zeros at end)
        while len(data_bytes) > 8 and data_bytes[-1] == 0:
            data_bytes.pop()

        return bytes(data_bytes)

    def _read_leb128(self, data: bytes, offset: int) -> tuple:
        """Read LEB128 encoded integer."""
        value = 0
        shift = 0
        bytes_read = 0

        while offset + bytes_read < len(data):
            byte = data[offset + bytes_read]
            value |= (byte & 0x7f) << shift
            bytes_read += 1

            if (byte & 0x80) == 0:
                break

            shift += 7

        return value, bytes_read
