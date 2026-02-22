"""
PixelRTS v2 Blueprint Layer

Provides structural metadata for PixelRTS containers, describing
logical components, memory layout, dependencies, and visual annotations.

Security Features:
- Input validation for DoS protection
- String sanitization for XSS prevention
- Version validation
- Coordinate validation
"""

from dataclasses import dataclass, field
from typing import List, Dict, Optional, Tuple
from enum import Enum
import json
import re
import html


# =============================================================================
# Security Constants
# =============================================================================

# Maximum number of components to prevent DoS attacks
MAX_COMPONENTS = 10000

# Supported blueprint versions
SUPPORTED_VERSIONS = {"1.0"}

# Valid entropy profiles
VALID_ENTROPY_PROFILES = {"low", "medium", "high"}

# Valid permission characters
VALID_PERMISSION_CHARS = {"r", "w", "x"}

# Minimum GPU alignment (must be power of 2)
MIN_GPU_ALIGNMENT = 16

# RGBA value range
RGBA_MIN = 0
RGBA_MAX = 255

# Regex patterns for validation
HEX_SIGNATURE_PATTERN = re.compile(r'^[0-9a-fA-F]+$')


# =============================================================================
# Validation Helper Functions
# =============================================================================

def sanitize_string(input_str: Optional[str]) -> str:
    """
    Sanitize string input to prevent XSS attacks.

    Removes HTML tags, escapes HTML entities, and strips null bytes.

    Args:
        input_str: String to sanitize

    Returns:
        Sanitized string safe for display
    """
    if input_str is None:
        return ""

    # Remove null bytes
    sanitized = input_str.replace('\x00', '')

    # Escape HTML entities to prevent XSS
    sanitized = html.escape(sanitized)

    return sanitized


def validate_component_count(count: int) -> None:
    """
    Validate component count does not exceed maximum.

    Args:
        count: Number of components

    Raises:
        ValueError: If count exceeds MAX_COMPONENTS
    """
    if count > MAX_COMPONENTS:
        raise ValueError(
            f"Component count {count} exceeds maximum of {MAX_COMPONENTS}. "
            "This limit prevents denial-of-service attacks."
        )


def validate_version(version: str) -> None:
    """
    Validate blueprint version is supported.

    Args:
        version: Version string to validate

    Raises:
        ValueError: If version is not supported
    """
    if version not in SUPPORTED_VERSIONS:
        raise ValueError(
            f"Unsupported blueprint version: {version}. "
            f"Supported versions: {', '.join(sorted(SUPPORTED_VERSIONS))}"
        )


def validate_hilbert_range(start_index: int, end_index: int,
                            pixel_start: Tuple[int, int],
                            pixel_end: Tuple[int, int]) -> None:
    """
    Validate Hilbert range coordinates.

    Args:
        start_index: Start index in Hilbert traversal
        end_index: End index in Hilbert traversal
        pixel_start: (x, y) start coordinates
        pixel_end: (x, y) end coordinates

    Raises:
        ValueError: If any coordinate validation fails
    """
    # Validate range order
    if end_index < start_index:
        raise ValueError(
            f"Invalid Hilbert range: end_index ({end_index}) "
            f"must be >= start_index ({start_index})"
        )

    # Validate pixel coordinates are non-negative
    for name, coords in [("pixel_start", pixel_start), ("pixel_end", pixel_end)]:
        for i, coord in enumerate(coords):
            if coord < 0:
                axis = "x" if i == 0 else "y"
                raise ValueError(
                    f"Invalid {name}: {axis} coordinate cannot be negative "
                    f"(got {coord})"
                )


def validate_rgba_color(color: Tuple[int, int, int, int]) -> None:
    """
    Validate RGBA color values are in valid range.

    Args:
        color: RGBA tuple (r, g, b, a)

    Raises:
        ValueError: If color values are out of range
    """
    if len(color) != 4:
        raise ValueError(
            f"RGBA color must have exactly 4 channels, got {len(color)}"
        )

    for i, value in enumerate(color):
        channel_name = ['red', 'green', 'blue', 'alpha'][i]
        if not (RGBA_MIN <= value <= RGBA_MAX):
            raise ValueError(
                f"Invalid {channel_name} channel: {value}. "
                f"Must be between {RGBA_MIN} and {RGBA_MAX}"
            )


def validate_entropy_profile(profile: str) -> None:
    """
    Validate entropy profile is one of the allowed values.

    Args:
        profile: Entropy profile string

    Raises:
        ValueError: If profile is invalid
    """
    if profile not in VALID_ENTROPY_PROFILES:
        raise ValueError(
            f"Invalid entropy profile: {profile}. "
            f"Valid values: {', '.join(sorted(VALID_ENTROPY_PROFILES))}"
        )


def validate_permissions(permissions: str) -> None:
    """
    Validate memory region permissions string.

    Args:
        permissions: Permission string (e.g., "rx", "rw", "rwx")

    Raises:
        ValueError: If permissions contain invalid characters
    """
    if not permissions:
        raise ValueError("Permissions string cannot be empty")

    invalid_chars = set(permissions) - VALID_PERMISSION_CHARS
    if invalid_chars:
        raise ValueError(
            f"Invalid permission characters: {', '.join(invalid_chars)}. "
            f"Valid characters: r, w, x"
        )


def validate_gpu_alignment(alignment: int) -> None:
    """
    Validate GPU alignment is a power of 2 and meets minimum.

    Args:
        alignment: GPU alignment value in bytes

    Raises:
        ValueError: If alignment is invalid
    """
    if alignment < MIN_GPU_ALIGNMENT:
        raise ValueError(
            f"GPU alignment {alignment} is below minimum {MIN_GPU_ALIGNMENT}"
        )

    # Check if power of 2
    if alignment & (alignment - 1) != 0:
        raise ValueError(
            f"GPU alignment must be a power of 2, got {alignment}"
        )


def validate_signature(signature: Optional[str]) -> None:
    """
    Validate security signature is valid hex string.

    Args:
        signature: Optional signature string

    Raises:
        ValueError: If signature contains invalid characters
    """
    if signature is None:
        return

    if not HEX_SIGNATURE_PATTERN.match(signature):
        raise ValueError(
            f"Invalid signature format: must be hexadecimal string, "
            f"got: {signature[:50]}{'...' if len(signature) > 50 else ''}"
        )


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
        """
        Deserialize blueprint from dictionary (JSON parsed).

        Validates all input data for security constraints.

        Args:
            data: Dictionary from parsed JSON

        Returns:
            PixelRTSBlueprint instance

        Raises:
            ValueError: If any validation fails
        """
        # Validate and sanitize version
        version = data.get("blueprint_version", "1.0")
        validate_version(version)

        # Sanitize string fields
        system_name = sanitize_string(data.get("system_name", ""))
        system_type = sanitize_string(data.get("system_type", ""))
        architecture = sanitize_string(data.get("architecture", ""))

        blueprint = cls(
            version=version,
            system_name=system_name,
            system_type=system_type,
            architecture=architecture,
            entry_point=data.get("entry_point")
        )

        # Parse and validate components
        components_data = data.get("components", [])
        if not isinstance(components_data, list):
            raise ValueError("components must be a list")

        # Validate component count before parsing
        validate_component_count(len(components_data))

        for comp_data in components_data:
            blueprint.components.append(cls._dict_to_component(comp_data))

        # Parse and validate memory map
        memory_data = data.get("memory_map", [])
        if not isinstance(memory_data, list):
            raise ValueError("memory_map must be a list")

        for mem_data in memory_data:
            blueprint.memory_map.append(cls._dict_to_memory(mem_data))

        # Parse and validate visual overlay
        overlay_data = data.get("visual_overlay", {})
        if not isinstance(overlay_data, dict):
            raise ValueError("visual_overlay must be a dictionary")

        blueprint.visual_overlay = cls._dict_to_overlay(overlay_data)

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
        """
        Convert dictionary to Component with validation.

        Args:
            data: Component dictionary

        Returns:
            Component instance

        Raises:
            ValueError: If validation fails
        """
        # Sanitize string fields
        comp_id = sanitize_string(data.get("id", ""))
        description = sanitize_string(data.get("description", ""))
        visual_hint = sanitize_string(data.get("visual_hint", ""))

        # Validate component type
        type_str = data.get("type", "data")
        try:
            comp_type = ComponentType(type_str)
        except ValueError:
            raise ValueError(
                f"Invalid component type: {type_str}. "
                f"Valid types: {[t.value for t in ComponentType]}"
            )

        # Validate entropy profile
        entropy_profile = data.get("entropy_profile", "low")
        validate_entropy_profile(entropy_profile)

        # Validate Hilbert range
        range_data = data.get("hilbert_range", {})
        if not isinstance(range_data, dict):
            raise ValueError("hilbert_range must be a dictionary")

        start_index = range_data.get("start_index", 0)
        end_index = range_data.get("end_index", 0)
        pixel_start = tuple(range_data.get("pixel_start", (0, 0)))
        pixel_end = tuple(range_data.get("pixel_end", (0, 0)))

        validate_hilbert_range(start_index, end_index, pixel_start, pixel_end)

        hilbert_range = HilbertRange(
            start_index=start_index,
            end_index=end_index,
            pixel_start=pixel_start,
            pixel_end=pixel_end
        )

        # Validate security info if present
        security_data = data.get("security")
        security = None
        if security_data:
            if isinstance(security_data, dict):
                signature = security_data.get("signature")
                if signature:
                    validate_signature(signature)

                security = SecurityInfo(
                    executable=security_data.get("executable", False),
                    writable=security_data.get("writable", False),
                    signature=signature
                )

        # Sanitize dependencies and tags
        dependencies = [
            sanitize_string(d) for d in data.get("dependencies", [])
            if isinstance(d, str)
        ]
        semantic_tags = [
            sanitize_string(t) for t in data.get("semantic_tags", [])
            if isinstance(t, str)
        ]

        return Component(
            id=comp_id,
            type=comp_type,
            description=description,
            hilbert_range=hilbert_range,
            entropy_profile=entropy_profile,
            visual_hint=visual_hint,
            dependencies=dependencies,
            semantic_tags=semantic_tags,
            security=security
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
        """
        Convert dictionary to MemoryRegion with validation.

        Args:
            data: MemoryRegion dictionary

        Returns:
            MemoryRegion instance

        Raises:
            ValueError: If validation fails
        """
        region = sanitize_string(data.get("region", ""))
        permissions = data.get("permissions", "")
        gpu_alignment = data.get("gpu_alignment", 256)

        # Validate permissions
        validate_permissions(permissions)

        # Validate GPU alignment
        validate_gpu_alignment(gpu_alignment)

        return MemoryRegion(
            region=region,
            permissions=permissions,
            gpu_alignment=gpu_alignment
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

    @staticmethod
    def _dict_to_overlay(data: dict) -> VisualOverlay:
        """
        Convert dictionary to VisualOverlay with validation.

        Args:
            data: VisualOverlay dictionary

        Returns:
            VisualOverlay instance

        Raises:
            ValueError: If validation fails
        """
        grid_overlay = data.get("grid_overlay", True)
        color_key = sanitize_string(data.get("color_key", "semantic"))
        legend = sanitize_string(data.get("legend", ""))
        highlight_boundaries = data.get("highlight_boundaries", True)

        # Validate boundary color
        boundary_color_data = data.get("boundary_color", (255, 255, 0, 128))
        if isinstance(boundary_color_data, list):
            boundary_color = tuple(boundary_color_data)
        else:
            boundary_color = boundary_color_data

        validate_rgba_color(boundary_color)

        return VisualOverlay(
            grid_overlay=grid_overlay,
            color_key=color_key,
            legend=legend,
            highlight_boundaries=highlight_boundaries,
            boundary_color=boundary_color
        )

    def to_json(self, indent: int = 2) -> str:
        """Serialize blueprint to JSON string."""
        return json.dumps(self.to_dict(), indent=indent)

    @classmethod
    def from_json(cls, json_str: str) -> 'PixelRTSBlueprint':
        """Deserialize blueprint from JSON string."""
        return cls.from_dict(json.loads(json_str))
