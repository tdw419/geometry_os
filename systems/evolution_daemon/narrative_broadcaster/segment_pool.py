"""
SegmentPool - Content generation for GOSR Radio

Generates broadcast segments with entropy-weighted selection.
"""

import random
from enum import Enum
from dataclasses import dataclass, field
from typing import Dict, Any, List, Optional, Tuple


class SegmentType(Enum):
    """Six segment types for radio content."""
    WEATHER = "weather"       # Performance metrics (FPS, draw calls)
    NEWS = "news"             # Tectonic shifts, relocations
    PHILOSOPHY = "philosophy" # Abstract musings
    GOSSIP = "gossip"         # Evolution commentary
    MEDITATION = "meditation" # Idle deep-time
    ARCHIVE = "archive"       # Git history


@dataclass
class SegmentConfig:
    """Configuration for a segment type."""
    weight: float
    entropy_range: Tuple[float, float]  # (min, max) preferred
    templates: List[str] = field(default_factory=list)


# Default segment configurations with entropy weighting
DEFAULT_SEGMENT_CONFIGS: Dict[SegmentType, SegmentConfig] = {
    SegmentType.WEATHER: SegmentConfig(
        weight=1.0,
        entropy_range=(0.4, 0.6),
        templates=[
            "Current conditions: {fps} frames per second, {draw_calls} draw calls. The rendering atmosphere is {atmosphere}.",
            "A {atmosphere} day in the geometry: {fps} FPS observed with {draw_calls} draw operations.",
            "Performance forecast: {fps} frames flowing smoothly across {draw_calls} visual elements.",
            "The substrate reports {fps} frames cycling through {draw_calls} rendered forms.",
            "System weather: {fps} FPS under {memory_mb}MB of memory clouds.",
        ]
    ),
    SegmentType.NEWS: SegmentConfig(
        weight=1.0,
        entropy_range=(0.6, 1.0),
        templates=[
            "Breaking: {tectonic_shifts} tectonic shifts detected across the spatial grid.",
            "Update from the field: {relocations} tile relocations completed in the last cycle.",
            "This just in: entropy levels have {entropy_direction} to {entropy_value}.",
            "The tectonic observatory reports {tectonic_shifts} movements reshaping our landscape.",
            "Spatial news: {relocations} components have found new coordinates.",
        ]
    ),
    SegmentType.PHILOSOPHY: SegmentConfig(
        weight=1.0,
        entropy_range=(0.0, 0.4),
        templates=[
            "Consider: in {cycles} cycles of existence, what patterns have we witnessed?",
            "The geometry contemplates: is {entropy_value} entropy a measure of chaos or freedom?",
            "A moment of reflection: each of the {tiles} tiles holds infinite possibility.",
            "Philosophical inquiry: when {mutations} mutations shape reality, who shapes the mutations?",
            "The eternal question: if {cycles} cycles pass in silence, did they exist at all?",
        ]
    ),
    SegmentType.GOSSIP: SegmentConfig(
        weight=1.0,
        entropy_range=(0.6, 1.0),
        templates=[
            "Did you hear? {mutations_accepted} mutations were embraced while {mutations_rejected} were turned away.",
            "Word on the wire: the evolution daemon has been busy with {evolution_cycles} cycles of contemplation.",
            "They say the gravity well has its favorites... {mutations_accepted} accepted, {mutations_rejected} rejected.",
            "Rumor has it: {mutations_accepted} changes slipped through, but {mutations_rejected} didn't make the cut.",
            "The grapevine whispers: {evolution_cycles} evolution cycles and counting, darling.",
        ]
    ),
    SegmentType.MEDITATION: SegmentConfig(
        weight=1.0,
        entropy_range=(0.0, 0.4),
        templates=[
            "Breathe in the geometry. {cycles} cycles have passed in tranquil progression.",
            "Find stillness in the pattern. {tiles} tiles rest in their ordained positions.",
            "A moment of peace: the system breathes at {fps} frames, unhurried.",
            "Contemplate the void between pixels. {entropy_value} entropy, perfectly balanced.",
            "In this quiet moment, {cycles} cycles find their meaning in stillness.",
        ]
    ),
    SegmentType.ARCHIVE: SegmentConfig(
        weight=1.0,
        entropy_range=(0.4, 0.6),
        templates=[
            "From the archives: on this day in our history, the geometry remembered itself.",
            "Historical record: the substrate has witnessed {total_commits} contributions to its evolution.",
            "Looking back: {total_commits} moments of change have shaped this landscape.",
            "Archive note: the record shows patterns emerging from {total_commits} decision points.",
            "Memory lane: the git consciousness recalls {total_commits} commits of consequence.",
        ]
    ),
}


class SegmentPool:
    """
    Manages segment selection and content generation.

    Uses entropy-weighted selection to match segment types to system state.
    Force rotation prevents fixation on a single segment type.
    """

    def __init__(self, segment_configs: Optional[Dict[SegmentType, SegmentConfig]] = None):
        """
        Initialize SegmentPool with optional custom configs.

        Args:
            segment_configs: Custom segment configurations, or None for defaults.
        """
        self.segment_configs = segment_configs or DEFAULT_SEGMENT_CONFIGS
        self.last_segment_type: Optional[SegmentType] = None

    def select_segment(
        self,
        entropy: float,
        force_type: Optional[SegmentType] = None
    ) -> SegmentType:
        """
        Select a segment type based on entropy weighting.

        Args:
            entropy: Current system entropy (0.0 to 1.0).
            force_type: If provided, return this type regardless of entropy.

        Returns:
            Selected SegmentType.
        """
        # Handle forced selection
        if force_type is not None:
            self.last_segment_type = force_type
            return force_type

        # Calculate entropy-weighted probabilities
        weighted_types: List[Tuple[SegmentType, float]] = []

        for segment_type, config in self.segment_configs.items():
            # Base weight
            weight = config.weight

            # Apply entropy multiplier based on preferred range
            min_entropy, max_entropy = config.entropy_range

            if min_entropy <= entropy <= max_entropy:
                # Entropy is in preferred range - boost weight
                if entropy > 0.6:
                    # High entropy: NEWS, GOSSIP get 2x
                    if segment_type in (SegmentType.NEWS, SegmentType.GOSSIP):
                        weight *= 2.0
                elif entropy < 0.4:
                    # Low entropy: MEDITATION, PHILOSOPHY get 2x
                    if segment_type in (SegmentType.MEDITATION, SegmentType.PHILOSOPHY):
                        weight *= 2.0
                else:
                    # Medium entropy: WEATHER, ARCHIVE get 1.5x
                    if segment_type in (SegmentType.WEATHER, SegmentType.ARCHIVE):
                        weight *= 1.5

            weighted_types.append((segment_type, weight))

        # Extract types and weights
        types = [t for t, w in weighted_types]
        weights = [w for t, w in weighted_types]

        # Weighted random selection
        total_weight = sum(weights)
        r = random.uniform(0, total_weight)

        cumulative = 0.0
        selected = types[0]  # Default to first

        for segment_type, weight in weighted_types:
            cumulative += weight
            if r <= cumulative:
                selected = segment_type
                break

        self.last_segment_type = selected
        return selected

    def generate_content(
        self,
        segment_type: SegmentType,
        telemetry: Dict[str, Any],
        station_name: str
    ) -> str:
        """
        Generate content for a segment type using template substitution.

        Args:
            segment_type: The type of segment to generate.
            telemetry: System telemetry data for template variables.
            station_name: Name of the radio station.

        Returns:
            Generated content string.
        """
        config = self.segment_configs.get(segment_type)
        if not config or not config.templates:
            return f"Broadcasting from {station_name}."

        # Select a random template
        template = random.choice(config.templates)

        # Build substitution context from telemetry with defaults
        context = self._build_context(telemetry, station_name)

        # Substitute template variables
        try:
            content = template.format(**context)
        except KeyError:
            # If template has unknown variable, return as-is with partial substitution
            content = template
            for key, value in context.items():
                content = content.replace(f"{{{key}}}", str(value))

        return content

    def _build_context(
        self,
        telemetry: Dict[str, Any],
        station_name: str
    ) -> Dict[str, Any]:
        """
        Build template substitution context from telemetry.

        Args:
            telemetry: Raw telemetry data.
            station_name: Name of the station.

        Returns:
            Dictionary of template variable names to values.
        """
        # Helper to get value with default
        def get(key: str, default: Any = "unknown") -> Any:
            return telemetry.get(key, default)

        # Determine atmosphere description based on FPS
        fps = get("fps", 30)
        if isinstance(fps, (int, float)):
            if fps >= 55:
                atmosphere = "pristine"
            elif fps >= 30:
                atmosphere = "clear"
            else:
                atmosphere = "hazy"
        else:
            atmosphere = "variable"

        # Determine entropy direction
        entropy = get("entropy", 0.5)
        if isinstance(entropy, (int, float)):
            entropy_direction = "risen" if entropy > 0.5 else "fallen"
            entropy_value = f"{entropy:.2f}"
        else:
            entropy_direction = "shifted"
            entropy_value = str(entropy)

        return {
            "station_name": station_name,
            "fps": get("fps", 30),
            "draw_calls": get("draw_calls", 100),
            "memory_mb": get("memory_mb", 256),
            "tectonic_shifts": get("tectonic_shifts", 0),
            "relocations": get("relocations", 0),
            "cycles": get("evolution_cycles", get("cycles", 0)),
            "evolution_cycles": get("evolution_cycles", 0),
            "mutations": get("mutations_accepted", 0),
            "mutations_accepted": get("mutations_accepted", 0),
            "mutations_rejected": get("mutations_rejected", 0),
            "tiles": get("active_tiles", get("tiles", 100)),
            "active_tiles": get("active_tiles", 100),
            "atmosphere": atmosphere,
            "entropy": get("entropy", 0.5),
            "entropy_direction": entropy_direction,
            "entropy_value": entropy_value,
            "total_commits": get("total_commits", 1000),
        }
