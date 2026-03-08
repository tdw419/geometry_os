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
        3. Creates a PixelRTSDecoder for range decoding
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

        # Import decoder (lazy to avoid import overhead)
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder

        # Create decoder instance for range decoding
        self._decoder = PixelRTSDecoder()

        # Try to decode a single byte to validate the container
        # and extract metadata
        try:
            # This will parse metadata and validate the container
            self._decoder.decode_range(self._png_data, 0, 1)
        except Exception as e:
            raise ValueError(
                f"Not a valid PixelRTS container: {self.file}. "
                f"Error: {e}"
            )

        # Get metadata from decoder
        self._metadata = self._decoder.get_metadata()

        if not self._metadata:
            raise ValueError(
                f"Not a valid PixelRTS container: {self.file}. "
                "Missing PixelRTS metadata."
            )

        # Get data size from metadata
        # Use data_size for uncompressed, encoded_size for compressed
        if "encoded_size" in self._metadata:
            self._size = self._metadata["encoded_size"]
        elif "data_size" in self._metadata:
            self._size = self._metadata["data_size"]
        else:
            raise ValueError("Missing data_size in container metadata")

        if NBDKIT_AVAILABLE:
            nbdkit.debug(
                f"Loaded PixelRTS container: {self.file}, "
                f"size={self._size} bytes"
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

        This method uses range decoding via PixelRTSDecoder.decode_range()
        to read only the pixels needed for the requested byte range,
        enabling memory-efficient serving of large containers.

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
        # Validate bounds
        if offset < 0:
            raise ValueError(f"Negative offset: {offset}")
        if offset >= self._size:
            return b''

        # Clamp count to available bytes
        if offset + count > self._size:
            count = self._size - offset

        if count == 0:
            return b''

        # Use decoder's decode_range for memory-efficient serving
        return self._decoder.decode_range(self._png_data, offset, count)
