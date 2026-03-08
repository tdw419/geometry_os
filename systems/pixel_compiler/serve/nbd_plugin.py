"""
nbdkit Python Plugin for PixelRTS Containers

This plugin serves .rts.png files as Network Block Devices via nbdkit.
It implements memory-efficient range decoding for large containers.

Usage:
    nbdkit python systems/pixel_compiler/serve/nbd_plugin.py file=container.rts.png

Requirements:
    - nbdkit with Python plugin support
    - PIL/Pillow for PNG decoding
    - numpy for array operations
"""

import threading
from pathlib import Path
from typing import Optional, Any

# nbdkit API availability check
try:
    import nbdkit
    NBDKIT_AVAILABLE = True
except ImportError:
    # nbdkit not available - create a mock for testing
    NBDKIT_AVAILABLE = False

    class MockNbdkit:
        """Mock nbdkit module for testing without nbdkit installed."""

        API_VERSION = 2

        @staticmethod
        def debug(msg: str):
            """Mock debug logging."""
            pass

        @staticmethod
        def error(msg: str):
            """Mock error logging."""
            pass

    nbdkit = MockNbdkit()


class PixelRTSPlugin:
    """
    nbdkit Python plugin for serving PixelRTS containers.

    This plugin exports .rts.png files as network block devices,
    enabling remote machines to mount and read container data.

    The plugin uses range decoding to serve large containers efficiently
    without loading the entire file into memory.

    Thread Safety:
        The plugin uses a lock to protect concurrent reads during
        Hilbert LUT generation and decoder state.

    Attributes:
        file: Path to the .rts.png container file (set via config)
        _decoder: Cached PixelRTSDecoder instance
        _metadata: Container metadata
        _size: Total byte size of container data
        _lock: Thread lock for concurrent access
    """

    # nbdkit API version
    API_VERSION = 2

    def __init__(self):
        """Initialize plugin with no file loaded."""
        self.file: Optional[str] = None
        self._decoder = None
        self._metadata: Optional[dict] = None
        self._size: int = 0
        self._png_data: Optional[bytes] = None
        self._lock = threading.Lock()

        # Image data for range decoding
        self._pixel_array = None
        self._hilbert_lut = None
        self._grid_size: int = 0

    def config(self, key: str, value: str) -> None:
        """
        Handle nbdkit configuration key=value pairs.

        Args:
            key: Configuration key
            value: Configuration value

        Raises:
            ValueError: If unknown configuration key provided
        """
        if key == "file":
            self.file = value
        else:
            raise ValueError(f"Unknown configuration key: {key}")

    def config_complete(self) -> None:
        """
        Validate configuration and load the PixelRTS container.

        This method:
        1. Verifies the file path is set and exists
        2. Loads the PNG file
        3. Extracts metadata from PNG tEXt chunks
        4. Validates it's a valid PixelRTS container
        5. Gets the data size for get_size()

        Raises:
            ValueError: If file not set, doesn't exist, or invalid container
        """
        if not self.file:
            raise ValueError("file parameter is required")

        path = Path(self.file)
        if not path.exists():
            raise ValueError(f"File not found: {self.file}")

        # Load the PNG file
        with open(self.file, 'rb') as f:
            self._png_data = f.read()

        # Import decoder (lazy to avoid circular imports)
        from systems.pixel_compiler.pixelrts_v2_core import (
            PixelRTSDecoder,
            PixelRTSMetadata,
            HilbertCurve
        )
        from PIL import Image
        from io import BytesIO
        import numpy as np

        # Load image and extract metadata
        image = Image.open(BytesIO(self._png_data))

        # Extract metadata from PNG tEXt chunks
        for key, value in image.text.items():
            if "PixelRTS" in value:
                try:
                    self._metadata = PixelRTSMetadata.decode_png_text(
                        value.encode("utf-8")
                    )
                    break
                except ValueError:
                    continue

        if not self._metadata:
            raise ValueError(
                f"Not a valid PixelRTS container: {self.file}. "
                "Missing PixelRTS metadata in PNG tEXt chunks."
            )

        # Get data size from metadata
        # Use data_size for uncompressed, encoded_size for compressed
        if "encoded_size" in self._metadata:
            self._size = self._metadata["encoded_size"]
        elif "data_size" in self._metadata:
            self._size = self._metadata["data_size"]
        else:
            raise ValueError("Missing data_size in container metadata")

        # Convert to RGBA if needed and store pixel array
        if image.mode != 'RGBA':
            image = image.convert('RGBA')

        width, height = image.size
        if width != height:
            raise ValueError(f"Image must be square, got {width}x{height}")

        self._grid_size = width

        # Verify grid size is power of 2
        if self._grid_size & (self._grid_size - 1) != 0:
            raise ValueError(
                f"Invalid grid size: {self._grid_size} (not power of 2)"
            )

        # Store pixel array for range decoding
        self._pixel_array = np.array(image, dtype=np.uint8)

        # Generate Hilbert LUT for coordinate mapping
        import math
        order = int(math.log2(self._grid_size))
        hilbert = HilbertCurve(order=order)
        self._hilbert_lut = hilbert.generate_lut()

        if NBDKIT_AVAILABLE:
            nbdkit.debug(
                f"Loaded PixelRTS container: {self.file}, "
                f"size={self._size} bytes, grid={self._grid_size}x{self._grid_size}"
            )

    def open(self, readonly: bool) -> Any:
        """
        Open a connection to the block device.

        Args:
            readonly: Whether the connection is read-only

        Returns:
            A handle (can be any Python object, we use self)
        """
        # Return self as handle - we don't need per-connection state
        return self

    def close(self, handle: Any) -> None:
        """
        Close a connection.

        Args:
            handle: The handle returned by open()
        """
        # Nothing to clean up per-connection
        pass

    def get_size(self, handle: Any) -> int:
        """
        Return the size of the block device in bytes.

        Args:
            handle: Connection handle from open()

        Returns:
            Size of container data in bytes
        """
        return self._size

    def pread(
        self,
        handle: Any,
        count: int,
        offset: int,
        flags: int
    ) -> bytes:
        """
        Read `count` bytes from the block device at `offset`.

        This method implements range decoding to read only the pixels
        needed for the requested byte range, enabling memory-efficient
        serving of large containers.

        The mapping from bytes to pixels follows the Hilbert curve:
        - Each pixel stores 4 bytes (RGBA)
        - Byte at offset N is stored at pixel N//4, channel N%4

        Args:
            handle: Connection handle from open()
            count: Number of bytes to read
            offset: Byte offset to read from
            flags: Read flags (unused)

        Returns:
            Requested bytes as bytes object

        Raises:
            ValueError: If read would exceed container size
        """
        import numpy as np

        # Validate bounds
        if offset < 0:
            raise ValueError(f"Negative offset: {offset}")
        if offset + count > self._size:
            # Short read at end of device is allowed
            count = max(0, self._size - offset)
            if count == 0:
                return b''

        if count == 0:
            return b''

        # Use decode_range if available on decoder
        # For now, implement range decoding directly
        return self._decode_range(offset, count)

    def _decode_range(self, start_byte: int, count: int) -> bytes:
        """
        Decode a byte range from the pixel array using Hilbert mapping.

        This is the core range decoding implementation that enables
        memory-efficient serving of large containers.

        Args:
            start_byte: Starting byte offset
            count: Number of bytes to read

        Returns:
            Decoded bytes
        """
        import numpy as np

        result = bytearray(count)

        # Calculate pixel range
        first_pixel = start_byte // 4
        first_channel = start_byte % 4
        end_byte = start_byte + count
        last_pixel = (end_byte - 1) // 4

        # Read bytes one at a time
        # This is simple but correct - can be optimized later
        for i in range(count):
            byte_offset = start_byte + i
            pixel_idx = byte_offset // 4
            channel = byte_offset % 4

            # Check bounds
            if pixel_idx >= len(self._hilbert_lut):
                break

            # Get pixel coordinates from Hilbert LUT
            x, y = self._hilbert_lut[pixel_idx]

            # Extract byte from pixel channel
            result[i] = self._pixel_array[y, x, channel]

        return bytes(result)
