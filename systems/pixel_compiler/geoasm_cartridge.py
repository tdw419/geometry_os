"""
GeoASM Cartridge Writer

Packages GeoASM neural assembly programs into .rts.png containers
with proper metadata for the Geometry OS runtime.
"""

import numpy as np
from pathlib import Path
from typing import Optional, Dict, Any, List
import json
import hashlib

try:
    import png
    PNG_AVAILABLE = True
except ImportError:
    PNG_AVAILABLE = False

from systems.visual_shell.geoasm import Assembler, Instruction
from systems.pixel_compiler.geoasm_encoder import GeoASMEncoder


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
        name: Optional[str] = None,
        version: str = "1.0",
        description: Optional[str] = None,
        grid_size: Optional[int] = None,
    ) -> Dict[str, Any]:
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
        Create image array with pixel placement.

        Args:
            pixels: Instruction pixels (n, 4)
            grid_size: Grid dimensions

        Returns:
            Image array (grid_size, grid_size, 4)
        """
        # Create empty image
        image = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Place pixels in row-major order
        n_pixels = len(pixels)
        for i, pixel in enumerate(pixels):
            if i >= grid_size * grid_size:
                break
            x = i % grid_size
            y = i // grid_size
            image[y, x] = pixel

        return image

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
        instructions: List[Instruction],
        name: str,
        version: str,
        description: Optional[str],
        grid_size: int,
    ) -> Dict[str, Any]:
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
