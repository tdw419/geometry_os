#!/usr/bin/env python3
"""
Thumbnail Cache
Generates and caches thumbnails for .rts.png files.

Provides efficient thumbnail generation with persistent caching to avoid
regenerating thumbnails on every request.
"""

import os
import hashlib
import base64
import logging
from pathlib import Path
from typing import Optional
from dataclasses import dataclass


logger = logging.getLogger(__name__)


@dataclass
class ThumbnailResult:
    """Result of thumbnail generation or cache lookup."""

    path: str         # Path to cached thumbnail file
    cached: bool      # Whether it was already cached (vs freshly generated)
    size: int         # Thumbnail size (width=height)


class ThumbnailCache:
    """
    Manages thumbnail generation and caching for .rts.png files.

    Generates thumbnails on demand and caches them for fast retrieval.
    Uses content-based hashing for cache keys to handle file updates.

    Usage:
        cache = ThumbnailCache()
        result = cache.get_thumbnail("/path/to/file.rts.png", size=256)
        print(f"Thumbnail cached at: {result.path}")

        # For JSON API responses
        base64_data = cache.get_thumbnail_base64("/path/to/file.rts.png")
    """

    def __init__(
        self,
        cache_dir: str = "~/.cache/pixelrts/thumbnails",
        default_size: int = 256
    ):
        """
        Initialize thumbnail cache.

        Args:
            cache_dir: Directory to store cached thumbnails (default: ~/.cache/pixelrts/thumbnails)
            default_size: Default thumbnail size in pixels (default: 256)
        """
        self.cache_dir = Path(cache_dir).expanduser().resolve()
        self.default_size = default_size

        # Ensure cache directory exists
        self.cache_dir.mkdir(parents=True, exist_ok=True)
        logger.debug(f"Thumbnail cache initialized at: {self.cache_dir}")

    def get_thumbnail(
        self,
        rts_path: str,
        size: Optional[int] = None
    ) -> ThumbnailResult:
        """
        Get or generate a thumbnail for an .rts.png file.

        Args:
            rts_path: Path to .rts.png file
            size: Thumbnail size (default: self.default_size)

        Returns:
            ThumbnailResult with path and cache status

        Raises:
            FileNotFoundError: If rts_path does not exist
            ValueError: If file is not a valid image
        """
        if size is None:
            size = self.default_size

        rts_path = Path(rts_path).resolve()

        if not rts_path.exists():
            raise FileNotFoundError(f"RTS file not found: {rts_path}")

        # Generate cache key
        cache_key = self._generate_cache_key(str(rts_path), size)
        cache_path = self.cache_dir / f"{cache_key}.png"

        # Check if cached
        if cache_path.exists():
            logger.debug(f"Thumbnail cache hit: {rts_path.name}")
            return ThumbnailResult(
                path=str(cache_path),
                cached=True,
                size=size
            )

        # Generate thumbnail
        logger.debug(f"Generating thumbnail: {rts_path.name} at {size}x{size}")
        self._generate_thumbnail(rts_path, cache_path, size)

        return ThumbnailResult(
            path=str(cache_path),
            cached=False,
            size=size
        )

    def get_thumbnail_base64(
        self,
        rts_path: str,
        size: Optional[int] = None
    ) -> str:
        """
        Get thumbnail as base64-encoded string.

        Useful for JSON API responses where you want to embed
        the thumbnail directly in the response.

        Args:
            rts_path: Path to .rts.png file
            size: Thumbnail size (default: self.default_size)

        Returns:
            Base64-encoded PNG image string

        Raises:
            FileNotFoundError: If rts_path does not exist
            ValueError: If file is not a valid image
        """
        result = self.get_thumbnail(rts_path, size)

        # Read thumbnail and encode as base64
        with open(result.path, "rb") as f:
            thumbnail_data = f.read()

        return base64.b64encode(thumbnail_data).decode("utf-8")

    def clear_cache(self) -> int:
        """
        Clear all cached thumbnails.

        Returns:
            Number of cached files removed
        """
        count = 0
        for cache_file in self.cache_dir.glob("*.png"):
            try:
                cache_file.unlink()
                count += 1
            except Exception as e:
                logger.warning(f"Failed to delete cache file {cache_file}: {e}")

        logger.info(f"Cleared {count} cached thumbnails")
        return count

    def _generate_cache_key(self, rts_path: str, size: int) -> str:
        """
        Generate a cache key for a thumbnail.

        Uses MD5 hash of path and size for content-based caching.

        Args:
            rts_path: Path to .rts.png file
            size: Thumbnail size

        Returns:
            Cache key string
        """
        key_data = f"{rts_path}:{size}"
        return hashlib.md5(key_data.encode()).hexdigest()

    def _generate_thumbnail(
        self,
        rts_path: Path,
        cache_path: Path,
        size: int
    ) -> None:
        """
        Generate and save a thumbnail.

        Args:
            rts_path: Path to source .rts.png file
            cache_path: Path to save thumbnail
            size: Thumbnail size

        Raises:
            ImportError: If PIL/Pillow is not available
            ValueError: If file is not a valid image
        """
        try:
            from PIL import Image
        except ImportError:
            logger.error("PIL/Pillow is required for thumbnail generation")
            raise

        # Open source image
        img = Image.open(rts_path)

        # Create thumbnail (modifies image in-place)
        img.thumbnail((size, size), Image.Resampling.LANCZOS)

        # Save as PNG for lossless quality
        img.save(cache_path, format="PNG")
        img.close()

        logger.debug(f"Saved thumbnail: {cache_path}")
