"""
PixelRTS v2 Core Library
Implements Hilbert space-filling curve mapping and core encoding utilities.
"""

import numpy as np
from typing import List, Tuple
import hashlib
import json
from pathlib import Path


class HilbertCurve:
    """
    Generates Hilbert space-filling curve Look-Up Table (LUT)
    for mapping linear data to 2D pixel coordinates.
    """

    def __init__(self, order: int):
        """
        Initialize Hilbert curve.

        Args:
            order: Curve order (grid_size = 2^order). E.g., order=10 -> 1024x1024
        """
        self.order = order
        self.grid_size = 2 ** order
        self._lut = None

    def generate_lut(self) -> List[Tuple[int, int]]:
        """
        Generate LUT mapping pixel index -> (x, y) coordinates.

        Returns:
            List of (x, y) tuples in Hilbert traversal order
        """
        if self._lut is not None:
            return self._lut

        n = self.grid_size
        self._lut = []

        for index in range(n * n):
            x, y = self._index_to_coord(index, n)
            self._lut.append((x, y))

        return self._lut

    def _index_to_coord(self, index: int, n: int) -> Tuple[int, int]:
        """
        Convert linear index to Hilbert (x, y) coordinates.
        Based on the Hilbert curve algorithm.
        """
        x, y = 0, 0
        temp = index
        s = 1

        while s < n:
            rx = 1 & (temp >> 1)
            ry = 1 & (temp ^ rx)

            x, y = self._rotate(s, x, y, rx, ry)
            x += s * rx
            y += s * ry

            temp >>= 2
            s <<= 1

        return y, x  # Return (y, x) to match expected orientation

    def _rotate(self, s: int, x: int, y: int, rx: int, ry: int) -> Tuple[int, int]:
        """Rotate/flip quadrant appropriately."""
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        return x, y

    def index_to_coord(self, index: int) -> Tuple[int, int]:
        """Get (x, y) coordinate for given pixel index."""
        if self._lut is None:
            self.generate_lut()
        return self._lut[index]

    def coord_to_index(self, x: int, y: int) -> int:
        """Get pixel index for given (x, y) coordinate."""
        if self._lut is None:
            self.generate_lut()
        return self._lut.index((x, y))


class PixelRTSMetadata:
    """
    Manages PixelRTS v2 metadata encoding/decoding.
    Metadata stored in PNG tEXt chunk + sidecar JSON.
    """

    MAGIC = b"PixelRTS"
    VERSION = 2

    @staticmethod
    def create_metadata(
        grid_size: int,
        encoding_mode: str = "RGBA-dense",
        segments: dict = None
    ) -> dict:
        """
        Create metadata structure.

        Args:
            grid_size: Image dimension (power of 2)
            encoding_mode: "RGBA-dense" or "RGBA-code"
            segments: Dictionary of segment info (kernel, initrd, etc.)

        Returns:
            Metadata dictionary
        """
        metadata = {
            "format": f"PixelRTS-{PixelRTSMetadata.VERSION}.0",
            "format_version": PixelRTSMetadata.VERSION,
            "grid_size": grid_size,
            "encoding": {
                "type": encoding_mode,
                "bytes_per_pixel": 4,
                "mapping": "Hilbert space-filling curve"
            },
            "offsets": segments or {},
            "hashes": {}
        }

        # Add hashes for segments
        if segments:
            for name, info in segments.items():
                if "sha256" in info:
                    metadata["hashes"][name] = info["sha256"]

        return metadata

    @staticmethod
    def hash_data(data: bytes) -> str:
        """Calculate SHA256 hash of data."""
        return hashlib.sha256(data).hexdigest()

    @staticmethod
    def encode_png_text(metadata: dict) -> bytes:
        """
        Encode metadata for PNG tEXt chunk.

        Returns:
            Bytes suitable for PNG tEXt chunk
        """
        json_str = json.dumps(metadata, separators=(",", ":"))
        return PixelRTSMetadata.MAGIC + json_str.encode("utf-8")

    @staticmethod
    def decode_png_text(data: bytes) -> dict:
        """
        Decode metadata from PNG tEXt chunk.

        Args:
            data: Raw tEXt chunk data

        Returns:
            Metadata dictionary

        Raises:
            ValueError: If data is not valid PixelRTS metadata
        """
        if not data.startswith(PixelRTSMetadata.MAGIC):
            raise ValueError("Not a PixelRTS v2 container")

        json_str = data[len(PixelRTSMetadata.MAGIC):]
        return json.loads(json_str.decode("utf-8"))


def calculate_grid_size(data_size_bytes: int, bytes_per_pixel: int = 4) -> int:
    """
    Calculate minimum power-of-2 grid size for given data.

    Args:
        data_size_bytes: Size of data to encode
        bytes_per_pixel: Bytes per pixel (4 for RGBA)

    Returns:
        Power-of-2 grid dimension
    """
    import math

    # Handle edge case of empty data
    if data_size_bytes == 0:
        return 1  # Minimum 1x1 grid

    pixels_needed = math.ceil(data_size_bytes / bytes_per_pixel)
    side_len = math.ceil(math.sqrt(pixels_needed))

    # Handle edge case where side_len is 0
    if side_len == 0:
        return 1

    return 2 ** math.ceil(math.log2(side_len))


class PixelRTSEncoder:
    """
    Encodes binary data into PNG images using RGBA dense packing
    with Hilbert space-filling curve mapping.
    """

    def __init__(self, mode: str = "standard"):
        """
        Initialize encoder.

        Args:
            mode: Encoding mode - "standard" (RGBA dense) or "code" (semantic coloring)
        """
        if mode not in ("standard", "code"):
            raise ValueError(f"Invalid mode: {mode}. Must be 'standard' or 'code'")
        self.mode = mode

    def encode(
        self,
        data: bytes,
        metadata: dict = None,
        grid_size: int = None
    ) -> bytes:
        """
        Encode binary data to PNG image.

        Args:
            data: Binary data to encode
            metadata: Optional metadata dict (type, name, version, etc.)
            grid_size: Explicit grid size (auto-calculated if None)

        Returns:
            PNG image as bytes
        """
        from PIL import Image
        from io import BytesIO

        # Calculate grid size
        if grid_size is None:
            grid_size = calculate_grid_size(len(data), bytes_per_pixel=4)

        # Verify grid size is power of 2
        if grid_size & (grid_size - 1) != 0:
            raise ValueError(f"Grid size must be power of 2, got {grid_size}")

        # Initialize Hilbert curve
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Create pixel array
        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Encode data using Hilbert mapping
        data_len = len(data)
        pixels_needed = (data_len + 3) // 4  # 4 bytes per pixel

        for pixel_idx in range(min(pixels_needed, len(lut))):
            x, y = lut[pixel_idx]

            # Extract 4 bytes for this pixel
            start = pixel_idx * 4
            end = min(start + 4, data_len)
            pixel_data = data[start:end]

            # Pad with zeros if needed
            if len(pixel_data) < 4:
                pixel_data = pixel_data + b'\x00' * (4 - len(pixel_data))

            # Set pixel values (RGBA)
            if self.mode == "standard":
                pixel_array[y, x, 0] = pixel_data[0]  # R
                pixel_array[y, x, 1] = pixel_data[1]  # G
                pixel_array[y, x, 2] = pixel_data[2]  # B
                pixel_array[y, x, 3] = pixel_data[3]  # A
            else:  # code mode - placeholder for semantic coloring
                # For now, use same as standard
                # WASM semantic coloring will be handled by WASMCodeVisualizer
                pixel_array[y, x, 0] = pixel_data[0]
                pixel_array[y, x, 1] = pixel_data[1]
                pixel_array[y, x, 2] = pixel_data[2]
                pixel_array[y, x, 3] = pixel_data[3]

        # Create PNG image
        image = Image.fromarray(pixel_array, mode='RGBA')

        # Prepare metadata
        if metadata is None:
            metadata = {}

        # Add encoding metadata
        full_metadata = PixelRTSMetadata.create_metadata(
            grid_size=grid_size,
            encoding_mode="RGBA-dense" if self.mode == "standard" else "RGBA-code",
            segments=metadata.get("segments")
        )

        # Add custom metadata fields (including segments if present)
        for key, value in metadata.items():
            if key not in full_metadata or key == "segments":
                # Don't overwrite format version with user's content version
                if key == "version":
                    full_metadata["content_version"] = value
                else:
                    full_metadata[key] = value

        # Add data hash
        full_metadata["data_hash"] = PixelRTSMetadata.hash_data(data)
        full_metadata["data_size"] = data_len

        # Save to BytesIO with metadata
        buffer = BytesIO()

        # PNG doesn't natively support tEXt chunks in PIL's save method
        # We'll save without metadata and return it separately for now
        # For full implementation, we'd use pngtext or manual chunk insertion
        image.save(buffer, format='PNG')
        png_bytes = buffer.getvalue()

        # Store metadata as sidecar (caller can save to .meta.json)
        self._last_metadata = full_metadata

        return png_bytes

    def get_metadata(self) -> dict:
        """Get metadata from last encode operation."""
        return getattr(self, '_last_metadata', None)

    def save(
        self,
        data: bytes,
        output_path: str,
        metadata: dict = None,
        grid_size: int = None,
        sidecar: bool = True
    ):
        """
        Encode and save to file.

        Args:
            data: Binary data to encode
            output_path: Output PNG file path
            metadata: Optional metadata dict (type, name, version, etc.)
            grid_size: Explicit grid size (auto-calculated if None)
            sidecar: Whether to save sidecar JSON metadata file
        """
        png_bytes = self.encode(data, metadata, grid_size)
        metadata = self.get_metadata()

        # Write PNG file
        with open(output_path, 'wb') as f:
            f.write(png_bytes)

        # Save sidecar JSON if requested
        if sidecar and metadata:
            # Determine sidecar path
            if output_path.endswith('.rts.png'):
                sidecar_path = output_path.replace('.rts.png', '.meta.json')
            elif output_path.endswith('.png'):
                sidecar_path = output_path.replace('.png', '.meta.json')
            else:
                sidecar_path = output_path + '.meta.json'

            with open(sidecar_path, 'w') as f:
                json.dump(metadata, f, indent=2)


class PixelRTSDecoder:
    """
    Decodes binary data from PNG images encoded with PixelRTSEncoder.
    """

    def __init__(self):
        """Initialize decoder."""
        self._metadata = None

    def decode(self, png_data: bytes, expected_size: int = None) -> bytes:
        """
        Decode binary data from PNG image.

        Args:
            png_data: PNG image bytes
            expected_size: Expected data size (if known, for validation)

        Returns:
            Decoded binary data
        """
        from PIL import Image
        from io import BytesIO

        # Load PNG image
        image = Image.open(BytesIO(png_data))

        # Verify image is RGBA
        if image.mode != 'RGBA':
            image = image.convert('RGBA')

        # Get image dimensions
        width, height = image.size
        if width != height:
            raise ValueError(f"Image must be square, got {width}x{height}")

        grid_size = width

        # Verify grid size is power of 2
        if grid_size & (grid_size - 1) != 0:
            raise ValueError(f"Invalid grid size: {grid_size} (not power of 2)")

        # Initialize Hilbert curve
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Convert image to numpy array
        pixel_array = np.array(image, dtype=np.uint8)

        # Decode data using inverse Hilbert mapping
        data_parts = []

        # If we have metadata with data_size, use it
        if self._metadata and "data_size" in self._metadata:
            max_pixels = (self._metadata["data_size"] + 3) // 4
        elif expected_size:
            max_pixels = (expected_size + 3) // 4
        else:
            # Decode all non-zero pixels
            max_pixels = len(lut)

        for pixel_idx in range(max_pixels):
            x, y = lut[pixel_idx]

            # Extract RGBA bytes
            r = pixel_array[y, x, 0]
            g = pixel_array[y, x, 1]
            b = pixel_array[y, x, 2]
            a = pixel_array[y, x, 3]

            # Append to data
            data_parts.extend([r, g, b, a])

        # Convert to bytes
        data = bytes(data_parts)

        # Trim to expected size if known
        if self._metadata and "data_size" in self._metadata:
            data = data[:self._metadata["data_size"]]
        elif expected_size:
            data = data[:expected_size]

        return data

    def set_metadata(self, metadata: dict):
        """
        Set metadata from external source (e.g., sidecar JSON).

        Args:
            metadata: Metadata dictionary
        """
        self._metadata = metadata

    def get_metadata(self) -> dict:
        """Get metadata from last decode operation."""
        return self._metadata

    def verify_hash(self, data: bytes, expected_hash: str) -> bool:
        """
        Verify data integrity using SHA256 hash.

        Args:
            data: Decoded data
            expected_hash: Expected SHA256 hash

        Returns:
            True if hash matches
        """
        actual_hash = PixelRTSMetadata.hash_data(data)
        return actual_hash == expected_hash

    def load(self, input_path: str, verify_hash: bool = False) -> bytes:
        """
        Load and decode PNG file.

        Args:
            input_path: Input PNG file path
            verify_hash: Whether to verify SHA256 hash (requires sidecar metadata)

        Returns:
            Decoded binary data

        Raises:
            ValueError: If file is invalid or hash verification fails
        """
        with open(input_path, 'rb') as f:
            png_data = f.read()

        # Try to load sidecar metadata
        meta_path = Path(input_path).with_suffix('.meta.json')
        if meta_path.exists():
            import json
            with open(meta_path, 'r') as f:
                self._metadata = json.load(f)

        data = self.decode(png_data)

        # Verify hash if requested
        if verify_hash and self._metadata and 'data_hash' in self._metadata:
            expected_hash = self._metadata['data_hash']
            actual_hash = PixelRTSMetadata.hash_data(data)
            if actual_hash != expected_hash:
                raise ValueError(f"Hash mismatch: expected {expected_hash}, got {actual_hash}")

        return data

    def info(self, input_path: str) -> dict:
        """
        Get metadata information from PNG file and sidecar.

        Args:
            input_path: Input PNG file path

        Returns:
            Metadata dictionary

        Raises:
            ValueError: If PNG is invalid
        """
        # Try to load sidecar metadata first
        meta_path = Path(input_path).with_suffix('.meta.json')
        if meta_path.exists():
            import json
            with open(meta_path, 'r') as f:
                return json.load(f)

        # Fallback: extract from PNG (not fully implemented yet)
        # For now, raise error if no sidecar
        raise ValueError(f"No metadata found. Please provide .meta.json sidecar file.")
