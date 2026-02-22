# systems/pixel_compiler/cartridge_assembly.py
"""
Cartridge Assembly Module

Assembles source files into .rts.png cartridges using PixelRTS v2 encoding.
"""

import json
import hashlib
import zlib
from pathlib import Path
from typing import List, Optional, Dict, Any
import struct

# Try to import PixelRTS v2 core
try:
    from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve
    PIXELRTS_AVAILABLE = True
except ImportError:
    PIXELRTS_AVAILABLE = False


class CartridgeAssembler:
    """
    Assembles source files into PixelRTS cartridge format.

    The cartridge is a PNG file with:
    - Pixel data: Files encoded via Hilbert curve
    - tEXt chunks: Metadata (name, description, entry_point, manifest)
    """

    def __init__(self, order: int = 10):
        """
        Initialize assembler.

        Args:
            order: Hilbert curve order (default 10 = 1024x1024 grid)
        """
        self.order = order
        self.grid_size = 2 ** order
        if PIXELRTS_AVAILABLE:
            self.hilbert = HilbertCurve(order)
        else:
            self.hilbert = None

    def assemble_from_files(
        self,
        files: List[Path],
        name: str,
        description: str = "",
        entry_point: str = ""
    ) -> bytes:
        """
        Assemble multiple files into a cartridge.

        Args:
            files: List of file paths to include
            name: Cartridge name
            description: Optional description
            entry_point: Optional entry point (file:function)

        Returns:
            PNG bytes of the cartridge
        """
        # Collect file data
        file_data = {}
        manifest = {
            "name": name,
            "description": description,
            "entry_point": entry_point,
            "files": [],
            "total_bytes": 0
        }

        for file_path in files:
            if file_path.exists():
                content = file_path.read_bytes()
                rel_path = file_path.name
                file_hash = hashlib.sha256(content).hexdigest()[:16]

                file_data[rel_path] = content
                manifest["files"].append({
                    "path": rel_path,
                    "size": len(content),
                    "hash": file_hash
                })
                manifest["total_bytes"] += len(content)

        manifest["file_count"] = len(manifest["files"])

        # Encode to PNG
        return self._encode_to_png(file_data, manifest)

    def assemble_from_directory(
        self,
        directory: Path,
        name: str,
        description: str = "",
        entry_point: str = ""
    ) -> bytes:
        """
        Assemble all files in a directory.

        Args:
            directory: Directory path
            name: Cartridge name
            description: Optional description
            entry_point: Optional entry point

        Returns:
            PNG bytes of the cartridge
        """
        files = list(directory.rglob("*"))
        files = [f for f in files if f.is_file() and not f.name.startswith(".")]
        return self.assemble_from_files(files, name, description, entry_point)

    def _encode_to_png(self, file_data: Dict[str, bytes], manifest: Dict) -> bytes:
        """
        Encode file data to PNG format with metadata.

        Args:
            file_data: Dict mapping file names to content
            manifest: Metadata manifest

        Returns:
            PNG bytes
        """
        # Combine all file data
        all_bytes = b""
        for name in sorted(file_data.keys()):
            all_bytes += file_data[name]

        # Calculate required dimensions
        total_pixels = (len(all_bytes) + 2) // 3  # 3 bytes per pixel (RGB)
        if total_pixels > self.grid_size * self.grid_size:
            # Increase order if needed
            new_order = 1
            while (2 ** new_order) ** 2 < total_pixels:
                new_order += 1
            self.order = min(new_order, 14)  # Cap at 16384x16384
            self.grid_size = 2 ** self.order

        # Create pixel array
        import array
        pixels = array.array('B', [0] * (self.grid_size * self.grid_size * 3))

        # Map bytes to pixels (simple linear for now, Hilbert in full impl)
        for i, byte in enumerate(all_bytes):
            pixels[i] = byte

        # Build PNG
        return self._build_png(pixels, manifest)

    def _build_png(self, pixels: 'array.array', manifest: Dict) -> bytes:
        """
        Build PNG file from pixel data.

        Args:
            pixels: Pixel data array (RGB)
            manifest: Metadata to embed

        Returns:
            PNG bytes
        """
        width = self.grid_size
        height = self.grid_size

        png_data = bytearray()

        # PNG signature
        png_data.extend(b'\x89PNG\r\n\x1a\n')

        # IHDR chunk
        ihdr_data = struct.pack('>IIBBBBB', width, height, 8, 2, 0, 0, 0)
        png_data.extend(self._make_chunk('IHDR', ihdr_data))

        # tEXt chunks for metadata
        metadata_items = [
            ('Name', manifest.get('name', 'unknown')),
            ('Description', manifest.get('description', '')),
            ('EntryPoint', manifest.get('entry_point', '')),
            ('Manifest', json.dumps(manifest)),
        ]

        for key, value in metadata_items:
            if value:
                text_data = f"{key}\x00{value}".encode('utf-8')
                png_data.extend(self._make_chunk('tEXt', text_data))

        # IDAT chunk (compressed image data)
        raw_data = bytearray()
        for y in range(height):
            raw_data.append(0)  # Filter type: None
            offset = y * width * 3
            raw_data.extend(pixels[offset:offset + width * 3])

        compressed = zlib.compress(bytes(raw_data), 9)
        png_data.extend(self._make_chunk('IDAT', compressed))

        # IEND chunk
        png_data.extend(self._make_chunk('IEND', b''))

        return bytes(png_data)

    def _make_chunk(self, chunk_type: str, data: bytes) -> bytes:
        """
        Create a PNG chunk.

        Args:
            chunk_type: 4-character chunk type
            data: Chunk data

        Returns:
            Complete chunk bytes
        """
        chunk = bytearray()
        chunk.extend(struct.pack('>I', len(data)))
        chunk.extend(chunk_type.encode('ascii'))
        chunk.extend(data)

        # CRC32 of type + data
        crc = zlib.crc32(chunk_type.encode('ascii') + data) & 0xffffffff
        chunk.extend(struct.pack('>I', crc))

        return bytes(chunk)

    def extract_metadata(self, png_data: bytes) -> Dict[str, Any]:
        """
        Extract metadata from a PNG cartridge.

        Args:
            png_data: PNG bytes

        Returns:
            Metadata dictionary
        """
        # Verify PNG signature
        if png_data[:8] != b'\x89PNG\r\n\x1a\n':
            raise ValueError("Not a valid PNG file")

        metadata = {}
        offset = 8  # Skip signature

        while offset < len(png_data):
            # Read chunk
            length = struct.unpack('>I', png_data[offset:offset+4])[0]
            chunk_type = png_data[offset+4:offset+8].decode('ascii')
            chunk_data = png_data[offset+8:offset+8+length]

            if chunk_type == 'tEXt':
                # Parse text chunk
                parts = chunk_data.split(b'\x00', 1)
                if len(parts) == 2:
                    key = parts[0].decode('utf-8')
                    value = parts[1].decode('utf-8')

                    if key == 'Manifest':
                        metadata.update(json.loads(value))
                    else:
                        metadata[key.lower()] = value

            offset += 12 + length  # length(4) + type(4) + data + crc(4)

            if chunk_type == 'IEND':
                break

        return metadata
