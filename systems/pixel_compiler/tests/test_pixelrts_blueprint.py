"""Tests for PixelRTS v2 Blueprint layer."""

import pytest
from dataclasses import asdict
import sys
from pathlib import Path

# Add pixel_compiler to path for direct imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_blueprint import (
    ComponentType,
    Permission,
    SecurityInfo,
    HilbertRange,
    Component,
    MemoryRegion,
    VisualOverlay,
    PixelRTSBlueprint
)

def test_component_type_enum():
    """Test ComponentType enum has all required values."""
    assert ComponentType.EXECUTABLE == "executable"
    assert ComponentType.ARCHIVE == "archive"
    assert ComponentType.DATA == "data"
    assert ComponentType.CONFIG == "config"
    assert ComponentType.LIBRARY == "library"

def test_security_info_dataclass():
    """Test SecurityInfo dataclass creation and defaults."""
    security = SecurityInfo(executable=True, writable=False)
    assert security.executable is True
    assert security.writable is False
    assert security.signature is None

def test_hilbert_range_dataclass():
    """Test HilbertRange dataclass with pixel coordinates."""
    h_range = HilbertRange(
        start_index=0,
        end_index=1000,
        pixel_start=(0, 0),
        pixel_end=(32, 32)
    )
    assert h_range.start_index == 0
    assert h_range.end_index == 1000
    assert h_range.pixel_start == (0, 0)
    assert h_range.pixel_end == (32, 32)

def test_component_dataclass():
    """Test Component dataclass with all fields."""
    component = Component(
        id="kernel",
        type=ComponentType.EXECUTABLE,
        description="Linux Kernel",
        hilbert_range=HilbertRange(0, 1000, (0, 0), (32, 32)),
        entropy_profile="high",
        visual_hint="red_dominant"
    )
    assert component.id == "kernel"
    assert component.type == ComponentType.EXECUTABLE
    assert component.dependencies == []
    assert component.semantic_tags == []
    assert component.security is None

def test_component_with_optional_fields():
    """Test Component with dependencies and security."""
    component = Component(
        id="initrd",
        type=ComponentType.ARCHIVE,
        description="Initial RAM filesystem",
        hilbert_range=HilbertRange(1000, 5000, (32, 32), (128, 128)),
        entropy_profile="medium",
        visual_hint="textured_green",
        dependencies=["kernel"],
        semantic_tags=["boot", "filesystem"],
        security=SecurityInfo(executable=False, writable=False)
    )
    assert len(component.dependencies) == 1
    assert "kernel" in component.dependencies
    assert component.security is not None
    assert component.security.executable is False

def test_memory_region_dataclass():
    """Test MemoryRegion dataclass with permissions."""
    region = MemoryRegion(
        region=".text",
        permissions="rx",
        gpu_alignment=256
    )
    assert region.region == ".text"
    assert region.permissions == "rx"
    assert region.gpu_alignment == 256

def test_visual_overlay_dataclass():
    """Test VisualOverlay dataclass with defaults."""
    overlay = VisualOverlay()
    assert overlay.grid_overlay is True
    assert overlay.color_key == "semantic"
    assert overlay.highlight_boundaries is True
    assert overlay.boundary_color == (255, 255, 0, 128)

def test_pixelrts_blueprint_dataclass():
    """Test PixelRTSBlueprint with default values."""
    blueprint = PixelRTSBlueprint()
    assert blueprint.version == "1.0"
    assert blueprint.system_name == ""
    assert blueprint.components == []
    assert blueprint.memory_map == []

def test_pixelrts_blueprint_with_components():
    """Test PixelRTSBlueprint with components and memory map."""
    blueprint = PixelRTSBlueprint(
        version="1.0",
        system_name="Alpine Linux",
        system_type="Linux Kernel + Initrd",
        architecture="x86_64",
        components=[
            Component(
                id="kernel",
                type=ComponentType.EXECUTABLE,
                description="Linux Kernel 6.1",
                hilbert_range=HilbertRange(0, 1000, (0, 0), (32, 32)),
                entropy_profile="high",
                visual_hint="red_dominant"
            )
        ],
        memory_map=[
            MemoryRegion(region=".text", permissions="rx")
        ],
        entry_point="0x100000"
    )
    assert blueprint.system_name == "Alpine Linux"
    assert len(blueprint.components) == 1
    assert blueprint.components[0].id == "kernel"
    assert len(blueprint.memory_map) == 1
    assert blueprint.entry_point == "0x100000"


def test_permission_enum():
    """Test Permission enum has all required values."""
    assert Permission.READ == "r"
    assert Permission.WRITE == "w"
    assert Permission.EXECUTE == "x"


def test_blueprint_to_dict_serialization():
    """Test blueprint serialization to dictionary."""
    blueprint = PixelRTSBlueprint(
        system_name="Test System",
        system_type="Test Type",
        architecture="x86_64",
        entry_point="0x1000"
    )

    result = blueprint.to_dict()

    assert result["blueprint_version"] == "1.0"
    assert result["system_name"] == "Test System"
    assert result["system_type"] == "Test Type"
    assert result["architecture"] == "x86_64"
    assert result["entry_point"] == "0x1000"
    assert result["components"] == []
    assert result["memory_map"] == []
    assert "visual_overlay" in result


def test_blueprint_from_dict_deserialization():
    """Test blueprint deserialization from dictionary."""
    data = {
        "blueprint_version": "1.0",
        "system_name": "Test System",
        "system_type": "Test Type",
        "architecture": "x86_64",
        "components": [],
        "memory_map": [],
        "entry_point": "0x1000",
        "visual_overlay": {
            "grid_overlay": True,
            "color_key": "semantic",
            "legend": "",
            "highlight_boundaries": True,
            "boundary_color": [255, 255, 0, 128]
        }
    }

    blueprint = PixelRTSBlueprint.from_dict(data)

    assert blueprint.version == "1.0"
    assert blueprint.system_name == "Test System"
    assert blueprint.system_type == "Test Type"
    assert blueprint.architecture == "x86_64"
    assert blueprint.entry_point == "0x1000"
    assert blueprint.components == []
    assert blueprint.memory_map == []


def test_blueprint_to_json_serialization():
    """Test blueprint serialization to JSON string."""
    blueprint = PixelRTSBlueprint(
        system_name="JSON Test",
        architecture="aarch64"
    )

    json_str = blueprint.to_json()

    assert isinstance(json_str, str)
    assert "JSON Test" in json_str
    assert "aarch64" in json_str
    assert "blueprint_version" in json_str


def test_blueprint_from_json_deserialization():
    """Test blueprint deserialization from JSON string."""
    json_str = '{"blueprint_version": "1.0", "system_name": "JSON Test", "system_type": "", "architecture": "aarch64", "components": [], "memory_map": [], "entry_point": null, "visual_overlay": {"grid_overlay": true, "color_key": "semantic", "legend": "", "highlight_boundaries": true, "boundary_color": [255, 255, 0, 128]}}'

    blueprint = PixelRTSBlueprint.from_json(json_str)

    assert blueprint.version == "1.0"
    assert blueprint.system_name == "JSON Test"
    assert blueprint.architecture == "aarch64"


def test_blueprint_json_roundtrip():
    """Test blueprint survives JSON serialization roundtrip."""
    original = PixelRTSBlueprint(
        system_name="Roundtrip Test",
        system_type="Test Container",
        architecture="x86_64",
        entry_point="0x1000",
        components=[
            Component(
                id="test_component",
                type=ComponentType.DATA,
                description="Test component",
                hilbert_range=HilbertRange(0, 100, (0, 0), (10, 10)),
                entropy_profile="low",
                visual_hint="blue_dominant"
            )
        ],
        memory_map=[
            MemoryRegion(region=".text", permissions="rx", gpu_alignment=512)
        ]
    )

    # Serialize and deserialize
    json_str = original.to_json()
    restored = PixelRTSBlueprint.from_json(json_str)

    # Verify all fields match
    assert restored.system_name == original.system_name
    assert restored.system_type == original.system_type
    assert restored.architecture == original.architecture
    assert restored.entry_point == original.entry_point
    assert len(restored.components) == 1
    assert restored.components[0].id == "test_component"
    assert len(restored.memory_map) == 1
    assert restored.memory_map[0].region == ".text"
    assert restored.memory_map[0].gpu_alignment == 512


def test_component_serialization_in_blueprint():
    """Test component serialization within blueprint."""
    blueprint = PixelRTSBlueprint(
        system_name="Component Test",
        components=[
            Component(
                id="kernel",
                type=ComponentType.EXECUTABLE,
                description="Linux Kernel",
                hilbert_range=HilbertRange(0, 1000, (0, 0), (32, 32)),
                entropy_profile="high",
                visual_hint="red_dominant",
                dependencies=["initrd"],
                semantic_tags=["boot", "kernel"],
                security=SecurityInfo(executable=True, writable=False)
            )
        ]
    )

    data = blueprint.to_dict()

    assert len(data["components"]) == 1
    comp_data = data["components"][0]
    assert comp_data["id"] == "kernel"
    assert comp_data["type"] == "executable"
    assert comp_data["dependencies"] == ["initrd"]
    assert comp_data["semantic_tags"] == ["boot", "kernel"]
    assert comp_data["security"]["executable"] is True
    assert comp_data["security"]["writable"] is False


def test_memory_region_serialization_in_blueprint():
    """Test memory region serialization within blueprint."""
    blueprint = PixelRTSBlueprint(
        memory_map=[
            MemoryRegion(region=".text", permissions="rx", gpu_alignment=256),
            MemoryRegion(region=".data", permissions="rw", gpu_alignment=512)
        ]
    )

    data = blueprint.to_dict()

    assert len(data["memory_map"]) == 2
    assert data["memory_map"][0]["region"] == ".text"
    assert data["memory_map"][0]["permissions"] == "rx"
    assert data["memory_map"][0]["gpu_alignment"] == 256
    assert data["memory_map"][1]["gpu_alignment"] == 512


def test_visual_overlay_serialization():
    """Test visual overlay configuration serialization."""
    overlay = VisualOverlay(
        grid_overlay=False,
        color_key="entropy",
        legend="Test legend",
        highlight_boundaries=False,
        boundary_color=(255, 0, 0, 200)
    )

    blueprint = PixelRTSBlueprint(visual_overlay=overlay)
    data = blueprint.to_dict()

    assert data["visual_overlay"]["grid_overlay"] is False
    assert data["visual_overlay"]["color_key"] == "entropy"
    assert data["visual_overlay"]["legend"] == "Test legend"
    assert data["visual_overlay"]["highlight_boundaries"] is False
    assert data["visual_overlay"]["boundary_color"] == [255, 0, 0, 200]
