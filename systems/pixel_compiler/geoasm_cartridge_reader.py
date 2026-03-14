"""
GeoASM Cartridge Reader

Reads GeoASM neural assembly programs from .rts.png containers
with metadata verification.
"""

from pathlib import Path
from typing import Any

import numpy as np

from systems.pixel_compiler.geoasm_encoder import GeoASMEncoder
from systems.visual_shell.geoasm import Instruction


class GeoASMCartridgeReader:
    """
    Reads .rts.png cartridges and extracts GeoASM programs.

    The reader:
    - Loads PNG image and extracts pixels in row-major order
    - Decodes pixels to instructions using GeoASMEncoder
    - Loads metadata from sidecar .meta.json file
    - Verifies program hash against metadata
    """

    def __init__(self, lossless: bool = True):
        """
        Initialize cartridge reader.

        Args:
            lossless: Use lossless decoding (should match writer encoding)
        """
        self.encoder = GeoASMEncoder(lossless=lossless)

    def read_cartridge(self, cartridge_path: str) -> list[Instruction]:
        """
        Read .rts.png cartridge and extract program.

        Args:
            cartridge_path: Path to .rts.png cartridge file

        Returns:
            List of decoded Instructions

        Raises:
            FileNotFoundError: If cartridge file doesn't exist
        """
        path = Path(cartridge_path)
        if not path.exists():
            raise FileNotFoundError(f"Cartridge not found: {cartridge_path}")

        # Load PNG image
        image = self._load_png(cartridge_path)

        # Get metadata to know instruction count
        metadata = self.read_metadata(cartridge_path)
        instruction_count = metadata.get('instruction_count', 0)

        # Extract pixels in row-major order
        pixels = self._extract_pixels(image, instruction_count)

        # Decode pixels to instructions
        instructions = self.encoder.decode_program(pixels)

        return instructions

    def read_metadata(self, cartridge_path: str) -> dict[str, Any]:
        """
        Read metadata from sidecar .meta.json file.

        Args:
            cartridge_path: Path to .rts.png cartridge file

        Returns:
            Metadata dictionary

        Raises:
            FileNotFoundError: If metadata file doesn't exist
        """
        meta_path = Path(cartridge_path + '.meta.json')
        if not meta_path.exists():
            raise FileNotFoundError(f"Metadata not found: {meta_path}")

        import json
        with open(meta_path) as f:
            return json.load(f)

    def verify_hash(self, cartridge_path: str) -> bool:
        """
        Verify program hash against metadata.

        Args:
            cartridge_path: Path to .rts.png cartridge file

        Returns:
            True if hash matches, False otherwise
        """
        import hashlib

        try:
            # Read instructions
            instructions = self.read_cartridge(cartridge_path)

            # Calculate hash from raw bytes
            program_bytes = b''.join(inst.to_bytes() for inst in instructions)
            calculated_hash = hashlib.sha256(program_bytes).hexdigest()

            # Get expected hash from metadata
            metadata = self.read_metadata(cartridge_path)
            expected_hash = metadata.get('sha256', '')

            return calculated_hash == expected_hash
        except (FileNotFoundError, KeyError):
            return False

    def _load_png(self, cartridge_path: str) -> np.ndarray:
        """
        Load PNG image as numpy array.

        Args:
            cartridge_path: Path to PNG file

        Returns:
            Image array (height, width, 4) in RGBA format
        """
        # Try PIL first (more commonly available)
        try:
            from PIL import Image
            img = Image.open(cartridge_path)

            # Ensure RGBA mode
            if img.mode != 'RGBA':
                img = img.convert('RGBA')

            return np.array(img)
        except ImportError:
            pass

        # Fallback to pypng
        try:
            import png
            reader = png.Reader(filename=cartridge_path)
            width, height, rows, metadata = reader.read()

            # Convert to numpy array
            # pypng returns rows as iterators of flat values
            image = np.zeros((height, width, 4), dtype=np.uint8)

            for y, row in enumerate(rows):
                # Each row is flat list of RGBA values
                for x in range(width):
                    image[y, x, 0] = row[x * 4]      # R
                    image[y, x, 1] = row[x * 4 + 1]  # G
                    image[y, x, 2] = row[x * 4 + 2]  # B
                    image[y, x, 3] = row[x * 4 + 3]  # A

            return image
        except ImportError:
            raise ImportError("Need PIL or pypng for PNG reading")

    def _extract_pixels(self, image: np.ndarray, instruction_count: int) -> np.ndarray:
        """
        Extract pixels from image in Hilbert-ordered placement.

        Args:
            image: Image array (height, width, 4)
            instruction_count: Number of instructions to extract

        Returns:
            Pixel array (N, 4) where N = instruction_count
        """
        height, width, _ = image.shape
        pixels = []

        # Hilbert extraction
        for i in range(instruction_count):
            if i >= height * width:
                break

            x, y = self._index_to_hilbert(i, width)
            pixels.append(image[y, x])

        return np.array(pixels, dtype=np.uint8)

    def _index_to_hilbert(self, index: int, n: int) -> tuple:
        """
        Convert 1D index to 2D Hilbert coordinates.
        
        Args:
            index: Hilbert index
            n: Grid size (power of 2)
            
        Returns:
            (x, y) coordinates
        """
        x = 0
        y = 0
        t = index
        s = 1
        while s < n:
            rx = 1 & (t // 2)
            ry = 1 & (t ^ rx)
            x, y = self._hilbert_rot(s, x, y, rx, ry)
            x += s * rx
            y += s * ry
            t //= 4
            s *= 2
        return x, y

    def _hilbert_rot(self, n: int, x: int, y: int, rx: int, ry: int) -> tuple:
        """Rotate/flip quadrant for Hilbert curve."""
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            return y, x
        return x, y
