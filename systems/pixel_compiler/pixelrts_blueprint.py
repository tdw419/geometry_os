"""
PixelRTS v2 Blueprint Layer

Provides structural metadata for PixelRTS containers, describing
logical components, memory layout, dependencies, and visual annotations.
"""

from dataclasses import dataclass, field
from typing import List, Dict, Optional, Tuple
from enum import Enum
import json


class ComponentType(str, Enum):
    """Types of components in a PixelRTS container."""
    EXECUTABLE = "executable"
    ARCHIVE = "archive"
    DATA = "data"
    CONFIG = "config"
    LIBRARY = "library"


class Permission(str, Enum):
    """Memory permission flags."""
    READ = "r"
    WRITE = "w"
    EXECUTE = "x"


@dataclass
class SecurityInfo:
    """Security annotations for a component."""
    executable: bool = False
    writable: bool = False
    signature: Optional[str] = None


@dataclass
class HilbertRange:
    """
    Hilbert curve addressing for component location in the 2D texture.

    Attributes:
        start_index: Starting pixel index in Hilbert traversal order
        end_index: Ending pixel index in Hilbert traversal order
        pixel_start: (x, y) coordinates of start in the image
        pixel_end: (x, y) coordinates of end in the image
    """
    start_index: int
    end_index: int
    pixel_start: Tuple[int, int]
    pixel_end: Tuple[int, int]


@dataclass
class Component:
    """
    A logical component within the PixelRTS container.

    Attributes:
        id: Unique identifier for this component
        type: Component type (executable, archive, data, etc.)
        description: Human-readable description
        hilbert_range: Location in the Hilbert-mapped image
        entropy_profile: Entropy level (high, medium, low)
        visual_hint: Visual color hint for rendering
        dependencies: List of component IDs this depends on
        semantic_tags: Semantic category tags
        security: Optional security annotations
    """
    id: str
    type: ComponentType
    description: str
    hilbert_range: HilbertRange
    entropy_profile: str  # "high", "medium", "low"
    visual_hint: str
    dependencies: List[str] = field(default_factory=list)
    semantic_tags: List[str] = field(default_factory=list)
    security: Optional[SecurityInfo] = None


@dataclass
class MemoryRegion:
    """
    Memory region definition for the loaded binary.

    Attributes:
        region: Region name (e.g., ".text", ".data", ".rodata")
        permissions: Permission string (e.g., "rx", "rw", "rwx")
        gpu_alignment: GPU alignment requirement in bytes (default 256)
    """
    region: str
    permissions: str
    gpu_alignment: int = 256


@dataclass
class VisualOverlay:
    """
    Visual overlay configuration for blueprint rendering.

    Attributes:
        grid_overlay: Whether to show the Hilbert grid overlay
        color_key: Color scheme (semantic, entropy, type)
        legend: Legend description text
        highlight_boundaries: Whether to highlight component boundaries
        boundary_color: RGBA color for boundary highlights
    """
    grid_overlay: bool = True
    color_key: str = "semantic"
    legend: str = ""
    highlight_boundaries: bool = True
    boundary_color: Tuple[int, int, int, int] = (255, 255, 0, 128)


@dataclass
class PixelRTSBlueprint:
    """
    Complete blueprint metadata for a PixelRTS v2 container.

    The blueprint describes the logical architecture of the encoded system,
    enabling visual understanding, semantic querying, and AI-driven analysis.
    """
    version: str = "1.0"
    system_name: str = ""
    system_type: str = ""
    architecture: str = ""
    components: List[Component] = field(default_factory=list)
    memory_map: List[MemoryRegion] = field(default_factory=list)
    entry_point: Optional[str] = None
    visual_overlay: VisualOverlay = field(default_factory=VisualOverlay)

    def to_dict(self) -> dict:
        """Serialize blueprint to dictionary for JSON encoding."""
        return {
            "blueprint_version": self.version,
            "system_name": self.system_name,
            "system_type": self.system_type,
            "architecture": self.architecture,
            "components": [self._component_to_dict(c) for c in self.components],
            "memory_map": [self._memory_to_dict(m) for m in self.memory_map],
            "entry_point": self.entry_point,
            "visual_overlay": self._overlay_to_dict(self.visual_overlay)
        }

    @classmethod
    def from_dict(cls, data: dict) -> 'PixelRTSBlueprint':
        """Deserialize blueprint from dictionary (JSON parsed)."""
        blueprint = cls(
            version=data.get("blueprint_version", "1.0"),
            system_name=data.get("system_name", ""),
            system_type=data.get("system_type", ""),
            architecture=data.get("architecture", ""),
            entry_point=data.get("entry_point")
        )

        # Parse components
        for comp_data in data.get("components", []):
            blueprint.components.append(cls._dict_to_component(comp_data))

        # Parse memory map
        for mem_data in data.get("memory_map", []):
            blueprint.memory_map.append(cls._dict_to_memory(mem_data))

        # Parse visual overlay
        overlay_data = data.get("visual_overlay", {})
        blueprint.visual_overlay = VisualOverlay(
            grid_overlay=overlay_data.get("grid_overlay", True),
            color_key=overlay_data.get("color_key", "semantic"),
            legend=overlay_data.get("legend", ""),
            highlight_boundaries=overlay_data.get("highlight_boundaries", True),
            boundary_color=tuple(overlay_data.get("boundary_color", (255, 255, 0, 128)))
        )

        return blueprint

    @staticmethod
    def _component_to_dict(component: Component) -> dict:
        """Convert Component to dictionary."""
        return {
            "id": component.id,
            "type": component.type.value,
            "description": component.description,
            "hilbert_range": {
                "start_index": component.hilbert_range.start_index,
                "end_index": component.hilbert_range.end_index,
                "pixel_start": list(component.hilbert_range.pixel_start),
                "pixel_end": list(component.hilbert_range.pixel_end)
            },
            "entropy_profile": component.entropy_profile,
            "visual_hint": component.visual_hint,
            "dependencies": component.dependencies,
            "semantic_tags": component.semantic_tags,
            "security": {
                "executable": component.security.executable,
                "writable": component.security.writable,
                "signature": component.security.signature
            } if component.security else None
        }

    @staticmethod
    def _dict_to_component(data: dict) -> Component:
        """Convert dictionary to Component."""
        range_data = data["hilbert_range"]
        security_data = data.get("security")

        return Component(
            id=data["id"],
            type=ComponentType(data["type"]),
            description=data["description"],
            hilbert_range=HilbertRange(
                start_index=range_data["start_index"],
                end_index=range_data["end_index"],
                pixel_start=tuple(range_data["pixel_start"]),
                pixel_end=tuple(range_data["pixel_end"])
            ),
            entropy_profile=data["entropy_profile"],
            visual_hint=data["visual_hint"],
            dependencies=data.get("dependencies", []),
            semantic_tags=data.get("semantic_tags", []),
            security=SecurityInfo(
                executable=security_data.get("executable", False),
                writable=security_data.get("writable", False),
                signature=security_data.get("signature")
            ) if security_data else None
        )

    @staticmethod
    def _memory_to_dict(memory: MemoryRegion) -> dict:
        """Convert MemoryRegion to dictionary."""
        return {
            "region": memory.region,
            "permissions": memory.permissions,
            "gpu_alignment": memory.gpu_alignment
        }

    @staticmethod
    def _dict_to_memory(data: dict) -> MemoryRegion:
        """Convert dictionary to MemoryRegion."""
        return MemoryRegion(
            region=data["region"],
            permissions=data["permissions"],
            gpu_alignment=data.get("gpu_alignment", 256)
        )

    @staticmethod
    def _overlay_to_dict(overlay: VisualOverlay) -> dict:
        """Convert VisualOverlay to dictionary."""
        return {
            "grid_overlay": overlay.grid_overlay,
            "color_key": overlay.color_key,
            "legend": overlay.legend,
            "highlight_boundaries": overlay.highlight_boundaries,
            "boundary_color": list(overlay.boundary_color)
        }

    def to_json(self, indent: int = 2) -> str:
        """Serialize blueprint to JSON string."""
        return json.dumps(self.to_dict(), indent=indent)

    @classmethod
    def from_json(cls, json_str: str) -> 'PixelRTSBlueprint':
        """Deserialize blueprint from JSON string."""
        return cls.from_dict(json.loads(json_str))
