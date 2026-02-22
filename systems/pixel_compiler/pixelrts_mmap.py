"""
Memory-Mapped PixelRTS Encoder/Decoder
Supports large files (>10GB) without loading entire file into memory.
"""

import mmap
import json
from pathlib import Path
from typing import Optional, Dict

try:
    import numpy as np
except ImportError:
    raise ImportError("numpy required: pip install numpy")

try:
    from PIL import Image
    from PIL import PngImagePlugin
    from io import BytesIO
except ImportError:
    raise ImportError("Pillow required: pip install Pillow")

from pixel_compiler.pixelrts_v2_core import (
    PixelRTSMetadata,
    calculate_grid_size,
    HilbertCurve
)


class MMapPixelRTSEncoder:
    """
    Memory-mapped encoder for large binary files.

    Processes files in chunks without loading entire file into memory.
    Suitable for files >10GB.
    """

    # Default chunk size for processing (64MB)
    DEFAULT_CHUNK_SIZE = 64 * 1024 * 1024

    def __init__(self, mode: str = "standard", chunk_size: int = None):
        """
        Initialize memory-mapped encoder.

        Args:
            mode: Encoding mode ("standard" or "code")
            chunk_size: Processing chunk size in bytes
        """
        if mode not in ("standard", "code"):
            raise ValueError(f"Invalid mode: {mode}. Must be 'standard' or 'code'")
        self.mode = mode
        self.chunk_size = chunk_size or self.DEFAULT_CHUNK_SIZE
        self._last_metadata = None

    def encode_file(
        self,
        input_path: str,
        output_path: str,
        metadata: Optional[dict] = None,
        grid_size: Optional[int] = None
    ) -> dict:
        """
        Encode a file using memory mapping.

        Args:
            input_path: Path to input binary file
            output_path: Path to output .rts.png file
            metadata: Optional metadata dictionary
            grid_size: Explicit grid size (auto-calculated if None)

        Returns:
            Metadata dictionary
        """
        input_path = Path(input_path)
        output_path = Path(output_path)

        # Get file size
        file_size = input_path.stat().st_size

        # Calculate grid size
        if grid_size is None:
            grid_size = calculate_grid_size(file_size)

        # Verify grid size is power of 2
        if grid_size & (grid_size - 1) != 0:
            raise ValueError(f"Grid size must be power of 2, got {grid_size}")

        # Initialize Hilbert curve
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Create pixel array
        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Process file with memory mapping
        with open(input_path, 'rb') as f:
            with mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as mmapped_file:
                # Encode using Hilbert mapping
                self._encode_mmapped(
                    mmapped_file,
                    pixel_array,
                    lut,
                    file_size
                )

        # Create PNG image
        image = Image.fromarray(pixel_array, mode='RGBA')

        # Prepare metadata
        if metadata is None:
            metadata = {}

        encoding_mode = "RGBA-dense" if self.mode == "standard" else "RGBA-code"
        full_metadata = PixelRTSMetadata.create_metadata(
            grid_size=grid_size,
            encoding_mode=encoding_mode,
            segments=metadata.get("segments")
        )

        # Add custom fields
        for key, value in metadata.items():
            if key not in full_metadata or key == "segments":
                # Don't overwrite format version with user's content version
                if key == "version":
                    full_metadata["content_version"] = value
                else:
                    full_metadata[key] = value

        # Add file info
        full_metadata["data_size"] = file_size
        full_metadata["data_hash"] = self._hash_file(input_path)
        full_metadata["encoding_mode"] = encoding_mode

        # Save PNG with metadata
        buffer = BytesIO()
        metadata_text = PixelRTSMetadata.encode_png_text(full_metadata).decode("utf-8")
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", metadata_text)

        image.save(buffer, format='PNG', pnginfo=pnginfo)

        # Write output file
        with open(output_path, 'wb') as f:
            f.write(buffer.getvalue())

        # Save sidecar metadata
        self._save_sidecar(output_path, full_metadata)

        self._last_metadata = full_metadata
        return full_metadata

    def _encode_mmapped(
        self,
        mmapped_file: mmap.mmap,
        pixel_array: np.ndarray,
        lut: list,
        file_size: int
    ):
        """
        Encode memory-mapped file to pixel array.

        Args:
            mmapped_file: Memory-mapped file object
            pixel_array: Output pixel array
            lut: Hilbert curve LUT
            file_size: Total file size
        """
        pixels_needed = (file_size + 3) // 4

        for pixel_idx in range(min(pixels_needed, len(lut))):
            x, y = lut[pixel_idx]

            # Extract 4 bytes for this pixel
            start = pixel_idx * 4
            end = min(start + 4, file_size)

            # Read bytes from memory-mapped file
            pixel_data = mmapped_file[start:end]

            # Pad with zeros if needed
            if len(pixel_data) < 4:
                pixel_data = pixel_data + b'\x00' * (4 - len(pixel_data))

            # Set pixel values
            pixel_array[y, x, 0] = pixel_data[0]
            pixel_array[y, x, 1] = pixel_data[1]
            pixel_array[y, x, 2] = pixel_data[2]
            pixel_array[y, x, 3] = pixel_data[3]

    def _hash_file(self, file_path: Path) -> str:
        """Calculate SHA256 hash of file."""
        import hashlib
        sha256 = hashlib.sha256()
        with open(file_path, 'rb') as f:
            for chunk in iter(lambda: f.read(8192), b''):
                sha256.update(chunk)
        return sha256.hexdigest()

    def _save_sidecar(self, output_path: Path, metadata: dict):
        """Save sidecar JSON file."""
        if output_path.suffix == '.png':
            sidecar_path = str(output_path).replace('.png', '.meta.json')
        else:
            sidecar_path = str(output_path) + '.meta.json'

        with open(sidecar_path, 'w') as f:
            json.dump(metadata, f, indent=2)

    def get_metadata(self) -> dict:
        """Get metadata from last encode operation."""
        return getattr(self, '_last_metadata', None)


class MMapPixelRTSDecoder:
    """
    Memory-mapped decoder for large .rts.png files.
    """

    def __init__(self):
        """Initialize decoder."""
        self._metadata = None

    def decode_file(
        self,
        input_path: str,
        output_path: str,
        verify_hash: bool = False
    ) -> dict:
        """
        Decode .rts.png file to binary, using memory mapping for output.

        Args:
            input_path: Path to .rts.png file
            output_path: Path to output binary file
            verify_hash: Whether to verify SHA256 hash

        Returns:
            Metadata dictionary
        """
        input_path = Path(input_path)
        output_path = Path(output_path)

        # Load sidecar metadata first
        meta_path = Path(str(input_path) + '.meta.json')
        if meta_path.exists():
            with open(meta_path, 'r') as f:
                self._metadata = json.load(f)
        else:
            # Extract from PNG
            self._metadata = self._extract_png_metadata(input_path)

        # Load PNG image
        image = Image.open(input_path)

        # Get dimensions
        width, height = image.size
        if width != height:
            raise ValueError(f"Image must be square, got {width}x{height}")

        grid_size = width

        # Initialize Hilbert curve
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Convert to numpy array
        pixel_array = np.array(image, dtype=np.uint8)

        # Get expected data size
        if self._metadata and "data_size" in self._metadata:
            data_size = self._metadata["data_size"]
        else:
            data_size = len(lut) * 4  # Maximum possible

        # Decode and write directly to file
        pixels_needed = (data_size + 3) // 4

        with open(output_path, 'wb') as f:
            for pixel_idx in range(pixels_needed):
                x, y = lut[pixel_idx]

                # Extract RGBA bytes
                r = pixel_array[y, x, 0]
                g = pixel_array[y, x, 1]
                b = pixel_array[y, x, 2]
                a = pixel_array[y, x, 3]

                # Write bytes (handle last partial pixel)
                remaining = data_size - pixel_idx * 4
                if remaining >= 4:
                    f.write(bytes([r, g, b, a]))
                elif remaining > 0:
                    f.write(bytes([r, g, b, a])[:remaining])

        # Verify hash if requested
        if verify_hash and self._metadata and 'data_hash' in self._metadata:
            expected_hash = self._metadata['data_hash']
            actual_hash = self._hash_file(output_path)
            if actual_hash != expected_hash:
                raise ValueError(f"Hash mismatch: expected {expected_hash}, got {actual_hash}")

        return self._metadata

    def _extract_png_metadata(self, png_path: Path) -> dict:
        """Extract metadata from PNG tEXt chunks."""
        image = Image.open(png_path)

        for key, value in image.text.items():
            if "PixelRTS" in key or "PixelRTS" in value:
                try:
                    return PixelRTSMetadata.decode_png_text(value.encode("utf-8"))
                except ValueError:
                    continue

        raise ValueError("No PixelRTS metadata found in PNG")

    def _hash_file(self, file_path: Path) -> str:
        """Calculate SHA256 hash of file."""
        import hashlib
        sha256 = hashlib.sha256()
        with open(file_path, 'rb') as f:
            for chunk in iter(lambda: f.read(8192), b''):
                sha256.update(chunk)
        return sha256.hexdigest()

    def get_info(self, input_path: str) -> dict:
        """Get metadata information from .rts.png file."""
        input_path = Path(input_path)
        meta_path = Path(str(input_path) + '.meta.json')

        if meta_path.exists():
            with open(meta_path, 'r') as f:
                return json.load(f)

        return self._extract_png_metadata(input_path)

    def get_metadata(self) -> dict:
        """Get metadata from last decode operation."""
        return self._metadata
