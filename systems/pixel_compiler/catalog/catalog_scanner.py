#!/usr/bin/env python3
"""
Catalog Scanner
Discovers and catalogs all .rts.png files in configured directories.

Extracts metadata from PNG tEXt chunks using PIL, following the pattern
established in RTSRegistryManager.
"""

import os
import hashlib
import logging
from pathlib import Path
from typing import List, Optional, Tuple
from dataclasses import dataclass


logger = logging.getLogger(__name__)


@dataclass
class CatalogEntry:
    """Represents a single .rts.png file in the catalog."""

    id: str                          # Unique identifier (hash of path)
    name: str                        # Display name (from metadata or filename)
    path: str                        # Absolute path to .rts.png file
    size: int                        # File size in bytes
    grid_size: Optional[str]         # From PNG metadata (e.g., "1024x1024")
    kernel_version: Optional[str]    # Kernel version from metadata
    distro: Optional[str]            # Distribution name from metadata
    architecture: Optional[str]      # CPU architecture from metadata
    thumbnail_position: Tuple[int, int] = (0, 0)  # Grid position for UI layout


class CatalogScanner:
    """
    Discovers and catalogs .rts.png files.

    Scans configured directories recursively for .rts.png files,
    extracts metadata from PNG tEXt chunks, and creates CatalogEntry objects.

    Usage:
        scanner = CatalogScanner(["/path/to/images", "/another/path"])
        entries = scanner.scan()
        for entry in entries:
            print(f"{entry.name}: {entry.path}")
    """

    def __init__(self, watch_paths: Optional[List[str]] = None):
        """
        Initialize scanner with directories to watch.

        Args:
            watch_paths: List of directories to scan (default: ["."] or from RTS_REGISTRY_PATH)
        """
        if watch_paths is None:
            # Check environment variable
            env_path = os.environ.get("RTS_REGISTRY_PATH")
            if env_path:
                watch_paths = [env_path]
            else:
                watch_paths = ["."]

        self.watch_paths = [Path(p).expanduser().resolve() for p in watch_paths]

    def scan(self) -> List[CatalogEntry]:
        """
        Scan all watch paths for .rts.png files.

        Returns:
            List of CatalogEntry objects for all discovered files
        """
        entries = []

        for watch_path in self.watch_paths:
            if not watch_path.exists():
                logger.warning(f"Watch path does not exist: {watch_path}")
                continue

            if not watch_path.is_dir():
                logger.warning(f"Watch path is not a directory: {watch_path}")
                continue

            # Recursively find all .rts.png files
            for rts_path in watch_path.rglob("*.rts.png"):
                try:
                    entry = self._create_entry(rts_path)
                    if entry:
                        entries.append(entry)
                        logger.debug(f"Discovered: {entry.name} at {entry.path}")
                except Exception as e:
                    logger.warning(f"Failed to process {rts_path}: {e}")
                    continue

        logger.info(f"Discovered {len(entries)} .rts.png files")
        return entries

    def _create_entry(self, rts_path: Path) -> Optional[CatalogEntry]:
        """
        Create a CatalogEntry from an .rts.png file.

        Extracts metadata from PNG tEXt chunks using PIL.

        Args:
            rts_path: Path to .rts.png file

        Returns:
            CatalogEntry object, or None if file cannot be processed
        """
        try:
            from PIL import Image
        except ImportError:
            logger.error("PIL/Pillow is required to read .rts.png metadata")
            raise

        # Get basic file info
        file_size = rts_path.stat().st_size
        file_id = self._generate_id(rts_path)

        # Extract metadata from PNG
        grid_size = None
        kernel_version = None
        distro = None
        architecture = None
        name = None

        try:
            img = Image.open(rts_path)

            # Extract grid size from image dimensions
            width, height = img.size
            if width == height:
                grid_size = f"{width}x{height}"

            # Extract metadata from tEXt chunks
            if img.text:
                # Check for common metadata fields
                # These follow the pixelrts conventions
                for key, value in img.text.items():
                    key_lower = key.lower()

                    if key_lower in ("pixelrts.grid_size", "grid_size"):
                        grid_size = value
                    elif key_lower in ("pixelrts.kernel", "kernel_version", "kernel"):
                        kernel_version = value
                    elif key_lower in ("pixelrts.distro", "distro"):
                        distro = value
                    elif key_lower in ("pixelrts.arch", "architecture", "arch"):
                        architecture = value
                    elif key_lower in ("pixelrts.name", "name"):
                        name = value
                    elif "pixelrts" in key_lower:
                        # Try to parse as JSON for structured metadata
                        try:
                            import json
                            metadata = json.loads(value)
                            if isinstance(metadata, dict):
                                grid_size = metadata.get("grid_size", grid_size)
                                kernel_version = metadata.get("kernel_version", kernel_version)
                                distro = metadata.get("distro", distro)
                                architecture = metadata.get("architecture", architecture)
                                name = metadata.get("name", name)
                        except (json.JSONDecodeError, ValueError):
                            pass

            img.close()

        except Exception as e:
            logger.warning(f"Could not read PNG metadata from {rts_path}: {e}")

        # Use filename stem as name if not in metadata
        if not name:
            name = rts_path.stem.replace(".rts", "")

        return CatalogEntry(
            id=file_id,
            name=name,
            path=str(rts_path),
            size=file_size,
            grid_size=grid_size,
            kernel_version=kernel_version,
            distro=distro,
            architecture=architecture,
            thumbnail_position=(0, 0)
        )

    def _generate_id(self, path: Path) -> str:
        """
        Generate a stable unique ID for a file path.

        Uses MD5 hash of the absolute path (first 12 characters).

        Args:
            path: Path to file

        Returns:
            12-character hex string ID
        """
        # Use absolute path for stability
        abs_path = str(path.resolve())
        return hashlib.md5(abs_path.encode()).hexdigest()[:12]
