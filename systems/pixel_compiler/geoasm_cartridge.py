"""
GeoASM Cartridge Writer

Packages GeoASM neural assembly programs into .rts.png containers
with proper metadata for the Geometry OS runtime.
"""

import hashlib
import json
from pathlib import Path
from typing import Any

import numpy as np

try:
    import png
    PNG_AVAILABLE = True
except ImportError:
    PNG_AVAILABLE = False

from systems.pixel_compiler.geoasm_encoder import GeoASMEncoder
from systems.visual_shell.geoasm import Assembler, Instruction


class GeoASMCartridgeWriter:
    """
    Creates .rts.png cartridges from GeoASM source code.

    The cartridge contains:
    - PNG image with instruction pixels
    - Sidecar .meta.json with executor info and blueprint
    """

    def __init__(self, lossless: bool = True):
        """
        Initialize cartridge writer.

        Args:
            lossless: Use lossless encoding (recommended)
        """
        self.assembler = Assembler()
        self.encoder = GeoASMEncoder(lossless=lossless)

    def calculate_grid_size(self, source: str) -> int:
        """
        Calculate minimum grid size for program.

        Args:
            source: GeoASM assembly source

        Returns:
            Grid size (power of 2)
        """
        instructions = self.assembler.assemble(source)
        n_pixels = len(instructions)

        # Find smallest power of 2 that fits
        grid_size = 1
        while grid_size * grid_size < n_pixels:
            grid_size *= 2

        return max(2, grid_size)  # Minimum 2x2

    def create_cartridge(
        self,
        source: str,
        output_path: str,
        name: str | None = None,
        version: str = "1.0",
        description: str | None = None,
        grid_size: int | None = None,
    ) -> dict[str, Any]:
        """
        Create .rts.png cartridge from GeoASM source.

        Args:
            source: GeoASM assembly source code
            output_path: Output .rts.png file path
            name: Program name (default: filename stem)
            version: Program version
            description: Program description
            grid_size: Explicit grid size (default: auto-calculated)

        Returns:
            Metadata dictionary
        """
        # Assemble source
        instructions = self.assembler.assemble(source)

        # Calculate grid size
        if grid_size is None:
            grid_size = self.calculate_grid_size(source)

        # Encode to pixels
        pixels = self.encoder.encode_program(instructions)

        # Create image array
        image = self._create_image(pixels, grid_size)

        # Save PNG
        self._save_png(image, output_path)

        # Create metadata
        name = name or Path(output_path).stem
        metadata = self._create_metadata(
            instructions=instructions,
            name=name,
            version=version,
            description=description,
            grid_size=grid_size,
        )

        # Save metadata
        meta_path = output_path + '.meta.json'
        with open(meta_path, 'w') as f:
            json.dump(metadata, f, indent=2)

        return metadata

    def _create_image(self, pixels: np.ndarray, grid_size: int) -> np.ndarray:
        """
        Create image array with Hilbert-ordered pixel placement.

        Args:
            pixels: Instruction pixels (n, 4)
            grid_size: Grid dimensions (must be power of 2)

        Returns:
            Image array (grid_size, grid_size, 4)
        """
        # Create empty image
        image = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Place pixels using Hilbert curve
        for i, pixel in enumerate(pixels):
            if i >= grid_size * grid_size:
                break

            x, y = self._index_to_hilbert(i, grid_size)
            image[y, x] = pixel

        return image

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

    def _save_png(self, image: np.ndarray, output_path: str) -> None:
        """Save image as PNG."""
        if PNG_AVAILABLE:
            # Use pypng for proper PNG writing
            height, width, _ = image.shape
            # Convert to 2D array with RGBA as flat tuples
            rows = []
            for y in range(height):
                row = []
                for x in range(width):
                    row.extend(image[y, x].tolist())
                rows.append(row)

            with open(output_path, 'wb') as f:
                writer = png.Writer(width=width, height=height, alpha=True)
                writer.write(f, rows)
        else:
            # Fallback to PIL if available
            try:
                from PIL import Image
                img = Image.fromarray(image, mode='RGBA')
                img.save(output_path)
            except ImportError:
                raise ImportError("Need pypng or PIL for PNG writing")

    def _create_metadata(
        self,
        instructions: list[Instruction],
        name: str,
        version: str,
        description: str | None,
        grid_size: int,
    ) -> dict[str, Any]:
        """Create cartridge metadata."""
        # Calculate program hash from raw bytes
        program_bytes = b''.join(inst.to_bytes() for inst in instructions)
        program_hash = hashlib.sha256(program_bytes).hexdigest()

        return {
            'executor': 'geoasm',
            'name': name,
            'version': version,
            'description': description or f"GeoASM neural program: {name}",
            'instruction_count': len(instructions),
            'grid_size': grid_size,
            'sha256': program_hash,
            'encoding': 'lossless' if self.encoder.lossless else 'semantic',
            'regions': {
                'register_file': {
                    'type': 'state',
                    'size': 8,
                    'description': 'R0-R7 registers'
                },
                'kv_cache': {
                    'type': 'memory',
                    'hidden_dim': 64,
                    'description': 'Key-Value cache for context'
                }
            }
        }
