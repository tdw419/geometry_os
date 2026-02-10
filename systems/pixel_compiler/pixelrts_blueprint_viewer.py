"""
PixelRTS Blueprint Viewer

Visualizes blueprint metadata as overlay images and interactive views.
"""

import json
from pathlib import Path
from typing import Optional, Tuple

try:
    from PIL import Image, ImageDraw, ImageFont
    import numpy as np
except ImportError:
    raise ImportError(
        "Blueprint viewer requires PIL and numpy. "
        "Install with: pip install Pillow numpy"
    )

from .pixelrts_blueprint import PixelRTSBlueprint, Component


class BlueprintViewer:
    """
    Visualizes PixelRTS blueprint metadata as image overlays.

    Features:
    - Component boundary highlighting
    - Color-coded visualization
    - Legend rendering
    - Interactive overlay generation
    """

    # Color mapping for visual hints
    COLOR_MAP = {
        "red_dominant": (255, 0, 0, 255),
        "textured_green": (0, 255, 0, 255),
        "blue_dominant": (0, 0, 255, 255),
        "dark_blue": (0, 0, 128, 255),
        "green_dominant": (0, 200, 0, 255),
        "gray": (128, 128, 128, 255),
        "white": (255, 255, 255, 255)
    }

    def __init__(self):
        """Initialize blueprint viewer."""
        self.font = None
        self._load_font()

    def _load_font(self):
        """Load font for text rendering."""
        font_paths = [
            "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
            "/usr/share/fonts/TTF/DejaVuSans.ttf",
            "/System/Library/Fonts/Helvetica.ttc",
            "C:\\Windows\\Fonts\\arial.ttf"
        ]

        for font_path in font_paths:
            try:
                self.font = ImageFont.truetype(font_path, 14)
                return
            except Exception:
                continue

        # Fall back to default font
        self.font = ImageFont.load_default()

    def load_blueprint_from_sidecar(
        self,
        rts_path: str
    ) -> Optional[PixelRTSBlueprint]:
        """
        Load blueprint from sidecar JSON file.

        Args:
            rts_path: Path to .rts.png file

        Returns:
            PixelRTSBlueprint if sidecar exists, None otherwise
        """
        # Try .rts.png.blueprint.json first
        blueprint_path = Path(str(rts_path) + ".blueprint.json")

        if not blueprint_path.exists():
            # Try .blueprint.json
            rts_path_obj = Path(rts_path)
            if rts_path_obj.suffix == '.png':
                blueprint_path = rts_path_obj.with_suffix('.blueprint.json')

        if blueprint_path.exists():
            try:
                with open(blueprint_path, 'r') as f:
                    blueprint_dict = json.load(f)
                return PixelRTSBlueprint.from_dict(blueprint_dict)
            except (json.JSONDecodeError, IOError):
                return None

        return None

    def load_blueprint_from_png(
        self,
        rts_path: str
    ) -> Optional[PixelRTSBlueprint]:
        """
        Load blueprint from embedded PNG tEXt chunk.

        Args:
            rts_path: Path to .rts.png file

        Returns:
            PixelRTSBlueprint if found, None otherwise
        """
        try:
            image = Image.open(Path(rts_path))

            # Check for PixelRTS-Blueprint tEXt chunk
            for key, value in image.text.items():
                if "PixelRTS-Blueprint" in key:
                    from .pixelrts_v2_core import PixelRTSMetadata
                    blueprint_dict = PixelRTSMetadata.decode_blueprint(
                        value.encode("utf-8")
                    )
                    return PixelRTSBlueprint.from_dict(blueprint_dict)

        except Exception:
            return None

        return None

    def load_blueprint(self, rts_path: str) -> Optional[PixelRTSBlueprint]:
        """
        Load blueprint from sidecar or embedded PNG metadata.

        Args:
            rts_path: Path to .rts.png file

        Returns:
            PixelRTSBlueprint if found, None otherwise
        """
        # Try sidecar first
        blueprint = self.load_blueprint_from_sidecar(rts_path)
        if blueprint:
            return blueprint

        # Fall back to embedded PNG metadata
        return self.load_blueprint_from_png(rts_path)

    def render_overlay(
        self,
        rts_path: str,
        blueprint: PixelRTSBlueprint,
        output_path: str,
        show_grid: bool = True,
        show_labels: bool = True
    ) -> str:
        """
        Render blueprint overlay on the PixelRTS image.

        Args:
            rts_path: Path to source .rts.png file
            blueprint: Blueprint metadata to render
            output_path: Path for output overlay image
            show_grid: Whether to show grid overlay
            show_labels: Whether to show component labels

        Returns:
            Path to rendered overlay image
        """
        # Load source image
        image = Image.open(rts_path)
        if image.mode != 'RGBA':
            image = image.convert('RGBA')

        # Create overlay
        overlay = image.copy()
        draw = ImageDraw.Draw(overlay)

        # Draw component boundaries
        for component in blueprint.components:
            self._draw_component_boundary(draw, component, show_labels)

        # Draw legend
        if blueprint.visual_overlay.legend:
            self._draw_legend(draw, blueprint, overlay.size)

        # Draw grid if requested
        if show_grid and blueprint.visual_overlay.grid_overlay:
            self._draw_grid(draw, overlay.size)

        # Save overlay
        overlay.save(output_path)

        return output_path

    def _draw_component_boundary(
        self,
        draw: ImageDraw.Draw,
        component: Component,
        show_label: bool
    ):
        """Draw highlighted boundary for a component."""
        h_range = component.hilbert_range

        # Get color from visual hint
        color = self.get_color_from_hint(component.visual_hint)

        # Draw rectangle boundary
        draw.rectangle(
            [
                h_range.pixel_start,
                h_range.pixel_end
            ],
            outline=color,
            width=2
        )

        # Draw label if requested
        if show_label:
            label_x = h_range.pixel_start[0]
            label_y = max(0, h_range.pixel_start[1] - 20)

            draw.text(
                (label_x, label_y),
                component.id,
                fill=color,
                font=self.font
            )

    def _draw_legend(
        self,
        draw: ImageDraw.Draw,
        blueprint: PixelRTSBlueprint,
        image_size: Tuple[int, int]
    ):
        """Draw legend on the overlay."""
        legend_text = blueprint.visual_overlay.legend

        if not legend_text:
            return

        # Position legend in bottom-right corner
        text_bbox = draw.textbbox((0, 0), legend_text, font=self.font)
        text_width = text_bbox[2] - text_bbox[0]
        text_height = text_bbox[3] - text_bbox[1]

        x = image_size[0] - text_width - 20
        y = image_size[1] - text_height - 20

        # Draw background
        draw.rectangle(
            [x - 10, y - 10, x + text_width + 10, y + text_height + 10],
            fill=(0, 0, 0, 180)
        )

        # Draw text
        draw.text((x, y), legend_text, fill=(255, 255, 0, 255), font=self.font)

    def _draw_grid(
        self,
        draw: ImageDraw.Draw,
        image_size: Tuple[int, int]
    ):
        """Draw grid overlay on the image."""
        grid_spacing = 64

        # Draw vertical lines
        for x in range(0, image_size[0], grid_spacing):
            draw.line(
                [(x, 0), (x, image_size[1])],
                fill=(255, 255, 255, 50),
                width=1
            )

        # Draw horizontal lines
        for y in range(0, image_size[1], grid_spacing):
            draw.line(
                [(0, y), (image_size[0], y)],
                fill=(255, 255, 255, 50),
                width=1
            )

    def get_color_from_hint(self, hint: str) -> Tuple[int, int, int, int]:
        """
        Map visual hint string to RGBA color tuple.

        Args:
            hint: Visual hint string

        Returns:
            RGBA color tuple
        """
        return self.COLOR_MAP.get(hint, (255, 255, 255, 255))

    def create_interactive_html(
        self,
        rts_path: str,
        blueprint: PixelRTSBlueprint,
        output_path: str
    ) -> str:
        """
        Create interactive HTML visualization of the blueprint.

        Args:
            rts_path: Path to source .rts.png file
            blueprint: Blueprint metadata
            output_path: Path for output HTML file

        Returns:
            Path to generated HTML file
        """
        html_template = """<!DOCTYPE html>
<html>
<head>
    <title>{system_name} - Blueprint Viewer</title>
    <style>
        body {{ font-family: Arial, sans-serif; margin: 20px; background: #1a1a1a; color: #eee; }}
        .container {{ max-width: 1200px; margin: 0 auto; }}
        .header {{ background: #333; padding: 20px; border-radius: 8px; margin-bottom: 20px; }}
        .image-container {{ position: relative; display: inline-block; }}
        .component {{ margin: 10px 0; padding: 10px; background: #2a2a2a; border-radius: 4px; }}
        .component-id {{ font-weight: bold; color: #4a9eff; }}
        .metadata {{ display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px; }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>{system_name}</h1>
            <p>Type: {system_type} | Architecture: {architecture}</p>
        </div>
        <div class="image-container">
            <img src="{image_name}" alt="PixelRTS Container" usemap="#componentmap">
        </div>
        <h2>Components ({component_count})</h2>
        {components_html}
    </div>
</body>
</html>"""

        # Generate components HTML
        components_html = ""
        for comp in blueprint.components:
            components_html += f"""
            <div class="component">
                <span class="component-id">{comp.id}</span>
                <p>{comp.description}</p>
                <div class="metadata">
                    <span>Type: {comp.type.value}</span>
                    <span>Entropy: {comp.entropy_profile}</span>
                    <span>Range: {comp.hilbert_range.start_index} - {comp.hilbert_range.end_index}</span>
                    <span>Visual: {comp.visual_hint}</span>
                </div>
            </div>"""

        # Fill template
        html = html_template.format(
            system_name=blueprint.system_name or "Unknown System",
            system_type=blueprint.system_type or "Unknown",
            architecture=blueprint.architecture or "Unknown",
            image_name=Path(rts_path).name,
            component_count=len(blueprint.components),
            components_html=components_html
        )

        # Write HTML file
        with open(output_path, 'w') as f:
            f.write(html)

        return output_path
