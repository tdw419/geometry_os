"""
PixelRTS Vision Analyzer

Analyzes PixelRTS container images (.rts.png) to extract visual information
and prepare them for vision model processing. Supports loading PNG data with
metadata from sidecar JSON files or embedded PNG tEXt chunks.
"""

import json
import re
from pathlib import Path
from typing import Dict, Tuple, Optional, Any, List
import base64
import io

try:
    from PIL import Image, ImageDraw, ImageFont
    import numpy as np
    import matplotlib
    matplotlib.use('Agg')  # Non-interactive backend
    import matplotlib.pyplot as plt
except ImportError:
    raise ImportError(
        "PixelRTS Vision Analyzer requires PIL, numpy, and matplotlib. "
        "Install with: pip install Pillow numpy matplotlib"
    )

try:
    from vision_model_client import VisionModelClient, ModelProvider
except ImportError:
    # VisionModelClient is optional for core functionality
    VisionModelClient = None
    ModelProvider = None


class PixelRTSVisionAnalyzer:
    """
    Analyzes PixelRTS container images for vision model processing.

    Features:
    - Loads PNG image and metadata from .meta.json sidecar
    - Extracts visual summary (dimensions, pixels, channels)
    - Generates entropy heatmap overlays
    - Prepares images for vision model input (resize + base64 encoding)
    """

    def __init__(self, rts_path: str):
        """
        Initialize analyzer with a PixelRTS PNG file.

        Args:
            rts_path: Path to .rts.png file

        Raises:
            FileNotFoundError: If file doesn't exist
            ValueError: If file is not a valid PNG
        """
        self.rts_path = rts_path
        self.metadata = None
        self.image = None

        # Validate file exists
        if not Path(rts_path).exists():
            raise FileNotFoundError(f"RTS PNG file not found: {rts_path}")

        # Load image
        self._load_image()
        # Load metadata
        self._load_metadata()

    def _load_image(self):
        """Load the PNG image."""
        try:
            with open(self.rts_path, 'rb') as f:
                png_data = f.read()
            self.image = Image.open(io.BytesIO(png_data))

            # Ensure RGBA mode
            if self.image.mode != 'RGBA':
                self.image = self.image.convert('RGBA')

        except Exception as e:
            raise ValueError(f"Failed to load PNG: {e}")

    def _load_metadata(self):
        """
        Load metadata from sidecar JSON or PNG tEXt chunks.

        Tries to load from sidecar first, then falls back to PNG metadata.
        """
        # Try sidecar JSON first
        # Check for .rts.png.meta.json pattern
        meta_path = Path(self.rts_path + ".meta.json")

        if not meta_path.exists():
            # Try .meta.json without .rts prefix
            rts_path_obj = Path(self.rts_path)
            if rts_path_obj.suffix == '.png':
                meta_path = rts_path_obj.with_suffix('.meta.json')

        if meta_path.exists():
            try:
                with open(meta_path, 'r') as f:
                    self.metadata = json.load(f)
                return
            except (json.JSONDecodeError, IOError) as e:
                pass  # Fall through to PNG metadata

        # Try to extract from PNG tEXt chunks
        self._load_metadata_from_png()

    def _load_metadata_from_png(self):
        """Load metadata from embedded PNG tEXt chunks."""
        try:
            # Reopen to access text metadata
            with open(self.rts_path, 'rb') as f:
                png_data = f.read()
            image = Image.open(io.BytesIO(png_data))

            for key, value in image.text.items():
                if "PixelRTS" in key or "PixelRTS" in value:
                    try:
                        # Strip magic prefix if present
                        if value.startswith("PixelRTS"):
                            value = value[8:]  # Remove "PixelRTS" prefix
                        self.metadata = json.loads(value)
                        return
                    except json.JSONDecodeError:
                        continue

            # No metadata found - create basic metadata from image
            self.metadata = {
                "width": self.image.width,
                "height": self.image.height,
                "format": "PNG",
                "unknown_source": True
            }

        except Exception:
            # Create minimal metadata
            self.metadata = {
                "width": self.image.width if self.image else 0,
                "height": self.image.height if self.image else 0,
                "format": "PNG"
            }

    def get_visual_summary(self) -> Dict[str, Any]:
        """
        Get visual summary of the PixelRTS image.

        Returns:
            Dictionary containing:
            - width: Image width in pixels
            - height: Image height in pixels
            - total_pixels: Total number of pixels
            - channels: Number of color channels (typically 4 for RGBA)
            - aspect_ratio: Width/height ratio
            - grid_size: Grid size if available in metadata
            - format: Format identifier from metadata
            - data_size: Data size if available in metadata
        """
        width, height = self.image.size
        summary = {
            "width": width,
            "height": height,
            "total_pixels": width * height,
            "channels": len(self.image.getbands()),
            "aspect_ratio": width / height if height > 0 else 1.0,
        }

        # Add metadata fields if available
        if "grid_size" in self.metadata:
            summary["grid_size"] = self.metadata["grid_size"]
        if "format" in self.metadata:
            summary["format"] = self.metadata["format"]
        if "data_size" in self.metadata:
            summary["data_size"] = self.metadata["data_size"]
        elif "size_bytes" in self.metadata:
            summary["size_bytes"] = self.metadata["size_bytes"]

        return summary

    def generate_entropy_overlay(
        self,
        output_dir: str,
        colormap: str = "viridis"
    ) -> str:
        """
        Generate entropy heatmap overlay visualization.

        Creates a colored heatmap showing pixel entropy/distribution patterns.
        Useful for visualizing data density in PixelRTS containers.

        Args:
            output_dir: Directory to save output image
            colormap: Matplotlib colormap name (default: "viridis")

        Returns:
            Path to generated overlay image
        """
        # Create output directory if needed
        output_path = Path(output_dir)
        output_path.mkdir(parents=True, exist_ok=True)

        # Convert image to numpy array
        img_array = np.array(self.image)

        # Calculate "entropy" - using pixel variance as proxy
        # For RGBA, compute variance across all channels
        entropy_map = np.std(img_array, axis=2)

        # Create heatmap
        fig, ax = plt.subplots(figsize=(8, 8))
        im = ax.imshow(entropy_map, cmap=colormap, interpolation='nearest')
        plt.colorbar(im, ax=ax, label='Pixel Variance (Entropy)')
        ax.set_title(f'Entropy Overlay: {Path(self.rts_path).name}')
        ax.axis('off')

        # Save figure
        output_file = output_path / f"{Path(self.rts_path).stem}_entropy_overlay.png"
        plt.savefig(output_file, bbox_inches='tight', dpi=150)
        plt.close(fig)

        return str(output_file)

    def prepare_for_vision_model(
        self,
        max_size: int = 512
    ) -> Tuple[Image.Image, str]:
        """
        Prepare image for vision model input.

        Resizes image if needed and returns both PIL image and base64-encoded
        PNG string suitable for API requests.

        Args:
            max_size: Maximum dimension (width or height). Images larger than
                     this will be resized while preserving aspect ratio.

        Returns:
            Tuple of (PIL Image, base64_encoded_string)
        """
        # Copy image to avoid modifying original
        img = self.image.copy()

        # Resize if needed
        width, height = img.size
        if max(width, height) > max_size:
            # Calculate new size preserving aspect ratio
            if width > height:
                new_width = max_size
                new_height = int(height * max_size / width)
            else:
                new_height = max_size
                new_width = int(width * max_size / height)

            img = img.resize((new_width, new_height), Image.LANCZOS)

        # Convert to base64
        buffer = io.BytesIO()
        img.save(buffer, format='PNG')
        png_bytes = buffer.getvalue()
        b64_string = base64.b64encode(png_bytes).decode('ascii')

        return img, b64_string

    def get_entropy_map(self) -> np.ndarray:
        """
        Get raw entropy map as numpy array.

        Returns a 2D array where each value represents the entropy/variance
        at that pixel position.

        Returns:
            2D numpy array of entropy values
        """
        img_array = np.array(self.image)
        return np.std(img_array, axis=2)

    def get_channel_histograms(self) -> Dict[str, np.ndarray]:
        """
        Get histogram for each color channel.

        Returns:
            Dictionary mapping channel names (R, G, B, A) to histograms
        """
        img_array = np.array(self.image)

        histograms = {}
        channel_names = ['R', 'G', 'B', 'A']

        for i, name in enumerate(channel_names):
            histograms[name] = np.histogram(
                img_array[:, :, i].flatten(),
                bins=256,
                range=(0, 256)
            )[0]

        return histograms

    def analyze_with_vision_model(
        self,
        provider: Any = None,
        api_key: Optional[str] = None
    ) -> str:
        """Perform vision model analysis on the PixelRTS artifact.

        Args:
            provider: Vision model provider to use (ModelProvider enum or string)
            api_key: Optional API key for the provider

        Returns:
            Vision model's analysis text

        Raises:
            ImportError: If vision_model_client is not available
            RuntimeError: If provider is not a valid ModelProvider
        """
        if VisionModelClient is None:
            raise ImportError(
                "VisionModelClient is not available. "
                "Ensure vision_model_client.py is in the same directory."
            )

        # Convert string provider to ModelProvider if needed
        if provider is None:
            if ModelProvider is None:
                raise RuntimeError("ModelProvider enum is not available")
            provider = ModelProvider.LM_STUDIO
        elif isinstance(provider, str):
            if ModelProvider is None:
                raise RuntimeError("ModelProvider enum is not available")
            provider = ModelProvider(provider)

        # Prepare image for vision model
        _, img_base64 = self.prepare_for_vision_model()

        # Build analysis prompt
        artifact_type = self._infer_artifact_type()
        client = VisionModelClient(provider=provider, api_key=api_key)
        prompt = client.build_analysis_prompt(artifact_type, self.metadata)

        # Perform analysis
        return client.analyze(prompt, img_base64)

    def _infer_artifact_type(self) -> str:
        """Infer artifact type from metadata and filename.

        Returns:
            Artifact type string (kernel, initrd, wasm, or binary)
        """
        # Check metadata first
        if self.metadata and "segments" in self.metadata:
            segments = self.metadata["segments"]
            for name, info in segments.items():
                if isinstance(info, dict):
                    type_str = info.get("type", "").lower()
                    if "kernel" in type_str:
                        return "kernel"
                    if "initrd" in type_str:
                        return "initrd"

        # Check metadata for direct type field
        if self.metadata:
            metadata_type = self.metadata.get("type", "").lower()
            if metadata_type:
                if "kernel" in metadata_type:
                    return "kernel"
                if "initrd" in metadata_type:
                    return "initrd"
                if "wasm" in metadata_type:
                    return "wasm"

        # Check filename
        name_lower = Path(self.rts_path).stem.lower()
        if "kernel" in name_lower or "vmlinuz" in name_lower or "bzimage" in name_lower:
            return "kernel"
        if "initrd" in name_lower or "initramfs" in name_lower:
            return "initrd"
        if "wasm" in name_lower or "module" in name_lower:
            return "wasm"

        return "binary"

    def parse_vision_findings(self, vision_response: str) -> Dict[str, List[str]]:
        """Parse structured findings from vision model response.

        Args:
            vision_response: Raw text response from vision model

        Returns:
            Dictionary with categorized findings:
            - structural_patterns: List of detected patterns
            - entropy_distribution: List of entropy observations
            - anomalies: List of detected anomalies
            - binary_format: List of format characteristics
        """
        findings = {
            "structural_patterns": [],
            "entropy_distribution": [],
            "anomalies": [],
            "binary_format": []
        }

        lines = vision_response.strip().split('\n')
        current_category = None

        for line in lines:
            line = line.strip()
            if not line:
                continue

            # Detect headers
            lower_line = line.lower()
            if "structural" in lower_line or "pattern" in lower_line:
                current_category = "structural_patterns"
            elif "entropy" in lower_line:
                current_category = "entropy_distribution"
            elif "anomal" in lower_line:
                current_category = "anomalies"
            elif "binary" in lower_line or "format" in lower_line:
                current_category = "binary_format"
            elif line.startswith(('-', '•', '*')) or (line and line[0].isdigit()):
                # List item
                content = line.lstrip('-•*').strip()
                content = re.sub(r'^\d+[\.\)]\s*', '', content)
                if content and current_category:
                    findings[current_category].append(content)

        return findings

    def generate_findings_overlay(
        self,
        findings: Dict[str, List[str]],
        output_dir: Optional[str] = None
    ) -> Path:
        """Generate visual overlay with vision model findings annotated.

        Args:
            findings: Parsed findings from vision model
            output_dir: Directory to save overlay (default: same as input)

        Returns:
            Path to annotated overlay PNG

        Raises:
            IOError: If overlay cannot be saved
        """
        if output_dir is None:
            output_dir = Path(self.rts_path).parent
        else:
            output_dir = Path(output_dir)

        output_dir.mkdir(parents=True, exist_ok=True)

        # Create a copy of the image
        overlay = self.image.copy()

        # Add text annotations
        draw = ImageDraw.Draw(overlay)

        # Try to load a font, fall back to default
        try:
            font = ImageFont.truetype(
                "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 16
            )
        except Exception:
            try:
                font = ImageFont.truetype(
                    "/usr/share/fonts/TTF/DejaVuSans.ttf", 16
                )
            except Exception:
                font = ImageFont.load_default()

        # Calculate overlay dimensions
        y_offset = 10
        max_height = 20

        for category, items in findings.items():
            if items:
                max_height = max(max_height, 20 + len(items[:3]) * 25 + 10)

        # Draw semi-transparent background
        draw.rectangle(
            [0, 0, min(600, overlay.width), max_height],
            fill=(0, 0, 0, 180)
        )

        # Draw findings
        for category, items in findings.items():
            if not items:
                continue

            # Draw category header
            draw.text(
                (10, y_offset),
                category.replace('_', ' ').title(),
                fill=(255, 255, 0),
                font=font
            )
            y_offset += 20

            # Draw items (limit to 3 per category)
            for item in items[:3]:
                # Truncate long items
                display_text = item[:80] + "..." if len(item) > 80 else item
                draw.text(
                    (20, y_offset),
                    f"• {display_text}",
                    fill=(255, 255, 255),
                    font=font
                )
                y_offset += 25
            y_offset += 10

        # Save overlay
        overlay_path = output_dir / f"{Path(self.rts_path).stem}_findings_overlay.png"
        overlay.save(overlay_path)

        return overlay_path


def analyze_rts_directory(directory: str, pattern: str = "*.rts.png") -> Dict[str, Dict[str, Any]]:
    """
    Analyze all PixelRTS files in a directory.

    Args:
        directory: Directory to scan
        pattern: Glob pattern for RTS files

    Returns:
        Dictionary mapping filenames to their visual summaries
    """
    results = {}
    dir_path = Path(directory)

    for rts_file in dir_path.glob(pattern):
        try:
            analyzer = PixelRTSVisionAnalyzer(str(rts_file))
            results[rts_file.name] = analyzer.get_visual_summary()
        except Exception as e:
            results[rts_file.name] = {"error": str(e)}

    return results
