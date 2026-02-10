"""Tests for PixelRTS blueprint viewer."""

import pytest
import tempfile
from pathlib import Path
from PIL import Image
from systems.pixel_compiler.pixelrts_blueprint_viewer import BlueprintViewer
from systems.pixel_compiler.pixelrts_blueprint import (
    PixelRTSBlueprint, Component, ComponentType, HilbertRange
)

def test_viewer_loads_blueprint_from_sidecar():
    """Test viewer loads blueprint from sidecar JSON."""
    viewer = BlueprintViewer()
    blueprint = viewer.load_blueprint_from_sidecar("dummy.rts.png")

    # Should return None for non-existent file
    assert blueprint is None

def test_viewer_creates_overlay():
    """Test viewer creates overlay image."""
    viewer = BlueprintViewer()

    # Create test image
    with tempfile.TemporaryDirectory() as tmpdir:
        test_image_path = Path(tmpdir) / "test.rts.png"
        test_image = Image.new('RGBA', (256, 256), color=(128, 128, 128, 255))
        test_image.save(test_image_path)

        # Create test blueprint
        blueprint = PixelRTSBlueprint(
            system_name="Test System",
            components=[
                Component(
                    id="test_component",
                    type=ComponentType.EXECUTABLE,
                    description="Test",
                    hilbert_range=HilbertRange(0, 100, (0, 0), (10, 10)),
                    entropy_profile="high",
                    visual_hint="red_dominant"
                )
            ]
        )

        output_path = Path(tmpdir) / "overlay.png"

        result = viewer.render_overlay(
            str(test_image_path),
            blueprint,
            str(output_path)
        )

        assert result == str(output_path)
        assert output_path.exists()

        # Verify overlay image is valid
        overlay = Image.open(output_path)
        assert overlay.size == (256, 256)

def test_get_color_from_visual_hint():
    """Test color mapping from visual hints."""
    viewer = BlueprintViewer()

    assert viewer.get_color_from_hint("red_dominant") == (255, 0, 0, 255)
    assert viewer.get_color_from_hint("textured_green") == (0, 255, 0, 255)
    assert viewer.get_color_from_hint("blue_dominant") == (0, 0, 255, 255)
    assert viewer.get_color_from_hint("dark_blue") == (0, 0, 128, 255)
    assert viewer.get_color_from_hint("green_dominant") == (0, 200, 0, 255)
    assert viewer.get_color_from_hint("gray") == (128, 128, 128, 255)
    assert viewer.get_color_from_hint("white") == (255, 255, 255, 255)
    assert viewer.get_color_from_hint("unknown") == (255, 255, 255, 255)

def test_load_blueprint_from_png():
    """Test viewer loads blueprint from PNG tEXt chunk."""
    viewer = BlueprintViewer()

    # Create test PNG without blueprint metadata
    with tempfile.TemporaryDirectory() as tmpdir:
        test_image_path = Path(tmpdir) / "test.rts.png"
        test_image = Image.new('RGBA', (256, 256), color=(128, 128, 128, 255))
        test_image.save(test_image_path)

        blueprint = viewer.load_blueprint_from_png(str(test_image_path))
        # Should return None for PNG without blueprint metadata
        assert blueprint is None

def test_load_blueprint_unified():
    """Test unified load_blueprint method tries sidecar first."""
    viewer = BlueprintViewer()

    with tempfile.TemporaryDirectory() as tmpdir:
        test_path = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_path)

        # Create blueprint sidecar
        blueprint_data = {
            "blueprint_version": "1.0",
            "system_name": "Test System",
            "components": [],
            "memory_map": []
        }
        import json
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"
        with open(blueprint_path, 'w') as f:
            json.dump(blueprint_data, f)

        blueprint = viewer.load_blueprint(str(test_path))
        assert blueprint is not None
        assert blueprint.system_name == "Test System"

def test_create_interactive_html():
    """Test HTML visualization generation."""
    viewer = BlueprintViewer()

    with tempfile.TemporaryDirectory() as tmpdir:
        test_image_path = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_image_path)

        blueprint = PixelRTSBlueprint(
            system_name="HTML Test System",
            system_type="Test Container",
            architecture="x86_64",
            components=[
                Component(
                    id="test_comp",
                    type=ComponentType.EXECUTABLE,
                    description="Test Component",
                    hilbert_range=HilbertRange(0, 100, (0, 0), (10, 10)),
                    entropy_profile="high",
                    visual_hint="red_dominant"
                )
            ]
        )

        output_path = Path(tmpdir) / "view.html"
        result = viewer.create_interactive_html(str(test_image_path), blueprint, str(output_path))

        assert result == str(output_path)
        assert output_path.exists()

        # Verify HTML content
        with open(output_path) as f:
            html_content = f.read()

        assert '<!DOCTYPE html>' in html_content
        assert 'HTML Test System' in html_content
        assert '</html>' in html_content
        assert 'test_comp' in html_content
        assert 'executable' in html_content

def test_render_overlay_with_grid():
    """Test overlay with grid option."""
    viewer = BlueprintViewer()

    with tempfile.TemporaryDirectory() as tmpdir:
        test_image_path = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_image_path)

        blueprint = PixelRTSBlueprint(
            system_name="Test",
            components=[]
        )

        output_path = Path(tmpdir) / "overlay.png"
        result = viewer.render_overlay(str(test_image_path), blueprint, str(output_path), show_grid=True)

        assert result == str(output_path)
        assert output_path.exists()

def test_render_overlay_without_grid():
    """Test overlay without grid option."""
    viewer = BlueprintViewer()

    with tempfile.TemporaryDirectory() as tmpdir:
        test_image_path = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_image_path)

        blueprint = PixelRTSBlueprint(
            system_name="Test",
            components=[]
        )

        output_path = Path(tmpdir) / "overlay.png"
        result = viewer.render_overlay(str(test_image_path), blueprint, str(output_path), show_grid=False)

        assert result == str(output_path)
        assert output_path.exists()
