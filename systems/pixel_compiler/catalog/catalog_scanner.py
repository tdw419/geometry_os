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
import json
from pathlib import Path
from typing import List, Optional, Tuple, Any
from dataclasses import dataclass, field

# Increase PIL limit for large RTS images
try:
    from PIL import Image
    Image.MAX_IMAGE_PIXELS = None
except ImportError:
    pass

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
    visual_description: Optional[str] = None  # AI-generated description
    detected_objects: List[str] = field(default_factory=list) # Detected UI elements
    thumbnail_position: Tuple[int, int] = (0, 0)  # Grid position for UI layout


class CatalogScanner:
    """
    Discovers and catalogs .rts.png files.

    Scans configured directories recursively for .rts.png files,
    extracts metadata from PNG tEXt chunks, and optionally performs
    vision analysis using Florence-2.
    """

    def __init__(
        self, 
        watch_paths: Optional[List[str]] = None,
        use_vision: bool = False,
        vision_model: Any = None
    ):
        """
        Initialize scanner.

        Args:
            watch_paths: List of directories to scan
            use_vision: Whether to use vision model for analysis
            vision_model: Optional pre-loaded FlorenceModel instance
        """
        if watch_paths is None:
            env_path = os.environ.get("RTS_REGISTRY_PATH")
            watch_paths = [env_path] if env_path else ["."]

        self.watch_paths = [Path(p).expanduser().resolve() for p in watch_paths]
        self.use_vision = use_vision
        self._vision_model = vision_model

    def scan(self) -> List[CatalogEntry]:
        """Scan all watch paths for .rts.png files."""
        entries = []

        # Load vision model if requested but not provided
        if self.use_vision and self._vision_model is None:
            try:
                from systems.vision.florence_model import FlorenceModel
                self._vision_model = FlorenceModel()
                self._vision_model.load()
            except Exception as e:
                logger.error(f"Failed to load vision model: {e}")
                self.use_vision = False

        for watch_path in self.watch_paths:
            if not watch_path.exists() or not watch_path.is_dir():
                continue

            for rts_path in watch_path.rglob("*.rts.png"):
                try:
                    entry = self._create_entry(rts_path)
                    if entry:
                        entries.append(entry)
                except Exception as e:
                    logger.warning(f"Failed to process {rts_path}: {e}")

        return entries

    def _create_entry(self, rts_path: Path) -> Optional[CatalogEntry]:
        """Create a CatalogEntry from an .rts.png file."""
        file_size = rts_path.stat().st_size
        file_id = self._generate_id(rts_path)

        grid_size = None
        kernel_version = None
        distro = None
        architecture = None
        name = None
        visual_description = None
        detected_objects = []

        try:
            img = Image.open(rts_path)
            width, height = img.size
            if width == height:
                grid_size = f"{width}x{height}"

            # Extract metadata
            if img.text:
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
                        try:
                            metadata = json.loads(value)
                            if isinstance(metadata, dict):
                                grid_size = metadata.get("grid_size", grid_size)
                                kernel_version = metadata.get("kernel_version", kernel_version)
                                distro = metadata.get("distro", distro)
                                # Ensure architecture is always a string
                                arch_val = metadata.get("architecture", architecture)
                                if isinstance(arch_val, str):
                                    architecture = arch_val
                                elif isinstance(arch_val, dict):
                                    architecture = arch_val.get("architecture", "unknown")
                                elif arch_val is not None:
                                    architecture = str(arch_val)
                                name = metadata.get("name", name)
                        except (json.JSONDecodeError, ValueError):
                            pass

            # Vision analysis (optional)
            if self.use_vision and self._vision_model:
                # Use a thumbnail for vision analysis to save memory/time
                vision_img = img.copy()
                vision_img.thumbnail((1024, 1024), Image.Resampling.LANCZOS)
                
                try:
                    # OCR for detectable text
                    ocr_res = self._vision_model.ocr(vision_img)
                    if ocr_res:
                        texts = [r.text for r in ocr_res if r.text.strip()]
                        if texts:
                            visual_description = f"Contains text: {', '.join(texts[:5])}"
                    
                    # Object detection for UI elements
                    od_res = self._vision_model.detect(vision_img)
                    if od_res:
                        detected_objects = list(set(r.class_name for r in od_res))
                except Exception as ve:
                    logger.warning(f"Vision analysis failed for {rts_path.name}: {ve}")
                finally:
                    vision_img.close()

            img.close()

        except Exception as e:
            logger.warning(f"Could not read PNG from {rts_path}: {e}")

        if not name:
            name = rts_path.stem.replace(".rts", "")

        return CatalogEntry(
            id=file_id,
            name=name,
            path=str(rts_path.resolve()),
            size=file_size,
            grid_size=grid_size,
            kernel_version=kernel_version,
            distro=distro,
            architecture=architecture,
            visual_description=visual_description,
            detected_objects=detected_objects,
            thumbnail_position=(0, 0)
        )

    def _generate_id(self, path: Path) -> str:
        abs_path = str(path.resolve())
        return hashlib.md5(abs_path.encode()).hexdigest()[:12]
