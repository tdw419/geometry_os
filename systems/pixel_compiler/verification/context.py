"""
Verification context for shared state and lazy data access.

Provides VerificationContext class that caches loaded data (PNG bytes, metadata, image)
for efficient access across multiple verification steps.
"""

from pathlib import Path
from typing import TYPE_CHECKING, Any, Optional

if TYPE_CHECKING:
    from PIL import Image


class VerificationContext:
    """
    Shared context for verification steps.

    Provides lazy loading and caching of:
    - Raw PNG file data
    - Parsed PixelRTS metadata
    - PIL Image object

    Usage:
        context = VerificationContext(Path("file.rts.png"))

        # Lazy load PNG data
        png_data = context.png_data  # Loads on first access, caches after

        # Lazy load image
        image = context.image  # Opens with PIL on first access

        # Lazy load metadata
        metadata = context.metadata  # Parses on first access
    """

    def __init__(self, file_path: Path):
        """
        Initialize verification context.

        Args:
            file_path: Path to the .rts.png file to verify
        """
        self.file_path = Path(file_path)
        self._png_data: bytes | None = None
        self._metadata: dict[str, Any] | None = None
        self._image: Image.Image | None = None
        self._load_errors: list = []

    @property
    def png_data(self) -> bytes | None:
        """
        Get raw PNG file data.

        Loads on first access and caches for subsequent calls.

        Returns:
            Raw PNG bytes, or None if file cannot be read
        """
        if self._png_data is None and not self._load_errors:
            try:
                self._png_data = self.file_path.read_bytes()
            except FileNotFoundError:
                self._load_errors.append(f"File not found: {self.file_path}")
            except PermissionError:
                self._load_errors.append(f"Permission denied: {self.file_path}")
            except Exception as e:
                self._load_errors.append(f"Error reading file: {e}")

        return self._png_data

    @property
    def metadata(self) -> dict[str, Any] | None:
        """
        Get parsed PixelRTS metadata.

        Parses metadata from PNG tEXt chunks on first access.
        Uses PixelRTSMetadata.decode_png_text() for parsing.

        Returns:
            Metadata dictionary, or None if parsing fails
        """
        if self._metadata is None and not self._load_errors:
            self._load_metadata()

        return self._metadata

    @property
    def image(self) -> Optional["Image.Image"]:
        """
        Get PIL Image object.

        Opens image with PIL on first access.

        Returns:
            PIL Image object, or None if image cannot be opened
        """
        if self._image is None and not self._load_errors:
            self._load_image()

        return self._image

    @property
    def load_errors(self) -> list:
        """Get any errors that occurred during data loading."""
        return self._load_errors.copy()

    def get_metadata(self) -> dict[str, Any] | None:
        """
        Explicitly get metadata (alias for metadata property).

        Returns:
            Metadata dictionary or None
        """
        return self.metadata

    def get_image(self) -> Optional["Image.Image"]:
        """
        Explicitly get image (alias for image property).

        Returns:
            PIL Image or None
        """
        return self.image

    def get_png_data(self) -> bytes | None:
        """
        Explicitly get PNG data (alias for png_data property).

        Returns:
            Raw PNG bytes or None
        """
        return self.png_data

    def _load_metadata(self) -> None:
        """Load and parse PixelRTS metadata from PNG tEXt chunks."""
        if self.png_data is None:
            return

        try:
            from io import BytesIO

            from PIL import Image

            # Open image to access tEXt chunks
            img = Image.open(BytesIO(self.png_data))

            # Look for PixelRTS metadata in text chunks
            for key, value in img.text.items():
                if "PixelRTS" in str(value):
                    try:
                        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata
                        self._metadata = PixelRTSMetadata.decode_png_text(
                            value.encode("utf-8")
                        )
                        return
                    except ValueError:
                        # Not valid PixelRTS metadata, continue searching
                        continue
                    except Exception as e:
                        self._load_errors.append(f"Metadata parse error: {e}")
                        return

            # No PixelRTS metadata found
            self._load_errors.append("No PixelRTS metadata found in PNG tEXt chunks")

        except Exception as e:
            self._load_errors.append(f"Error loading metadata: {e}")

    def _load_image(self) -> None:
        """Load PIL Image from PNG data."""
        if self.png_data is None:
            return

        try:
            from io import BytesIO

            from PIL import Image

            self._image = Image.open(BytesIO(self.png_data))
            # Force load to catch any decompression errors
            self._image.load()

        except Exception as e:
            self._load_errors.append(f"Error loading image: {e}")

    def clear_cache(self) -> None:
        """Clear all cached data (useful for memory management)."""
        self._png_data = None
        self._metadata = None
        if self._image is not None:
            self._image.close()
            self._image = None

    def __repr__(self) -> str:
        return f"<VerificationContext: {self.file_path}>"
