"""
TectonicEngine - Force-directed spatial realignment for Neural City.

Phase 28: Tectonic Realignment
- Calculates semantic gravity from NeuralMemoryHub similarity
- Calculates operational tension from bridge frequency
- Calculates anchor force to district center
- Detects Phase Shift (migration) thresholds

Physics Model:
    F_total = F_gravity(similarity) + F_tension(bridge_freq) - F_anchor(distance)

    Migration occurs when:
    F_foreign_district > 2 * F_anchor for 10+ seconds
"""
import asyncio
import logging
import math
import time
from dataclasses import dataclass, field
from typing import Dict, Tuple, Optional, List, Any
from collections import defaultdict

logger = logging.getLogger("evolution_daemon.tectonic_engine")

# District anchor positions (radial layout - 3 districts at 120° intervals)
DISTRICT_ANCHORS = {
    "cognitive": (200.0, 0.0),       # 0° - North
    "metabolic": (-100.0, 173.2),    # 120° - Southeast
    "substrate": (-100.0, -173.2)    # 240° - Southwest
}


@dataclass
class ForceVector:
    """
    Represents a 2D force vector.

    Attributes:
        dx: Force in x direction
        dy: Force in y direction
        magnitude: Total force magnitude
    """
    dx: float = 0.0
    dy: float = 0.0
    magnitude: float = 0.0

    def to_dict(self) -> Dict[str, float]:
        """Serialize to dictionary for JSON/WebSocket."""
        return {
            "dx": self.dx,
            "dy": self.dy,
            "magnitude": self.magnitude
        }

    def __add__(self, other: "ForceVector") -> "ForceVector":
        """Add two force vectors."""
        new_dx = self.dx + other.dx
        new_dy = self.dy + other.dy
        return ForceVector(
            dx=new_dx,
            dy=new_dy,
            magnitude=math.sqrt(new_dx*new_dx + new_dy*new_dy)
        )

    def __sub__(self, other: "ForceVector") -> "ForceVector":
        """Subtract two force vectors."""
        new_dx = self.dx - other.dx
        new_dy = self.dy - other.dy
        return ForceVector(
            dx=new_dx,
            dy=new_dy,
            magnitude=math.sqrt(new_dx*new_dx + new_dy*new_dy)
        )


@dataclass
class BuildingState:
    """
    Tracks the spatial state of a building in the force graph.

    Attributes:
        building_id: Unique identifier
        position: Current (x, y) position
        district: Current district (cognitive/metabolic/substrate)
        anchor_position: District center position
        foreign_forces: Map of district -> force magnitude from that district
        migration_timer: Seconds spent in migration threshold
        last_update: Timestamp of last update
    """
    building_id: str
    position: Tuple[float, float]
    district: str
    anchor_position: Tuple[float, float] = (0.0, 0.0)
    foreign_forces: Dict[str, float] = field(default_factory=dict)
    migration_timer: float = 0.0
    last_update: float = field(default_factory=time.time)

    @property
    def distance_from_anchor(self) -> float:
        """Calculate Euclidean distance from anchor position."""
        dx = self.position[0] - self.anchor_position[0]
        dy = self.position[1] - self.anchor_position[1]
        return math.sqrt(dx*dx + dy*dy)


@dataclass
class TectonicEngine:
    """
    Force-directed spatial engine for Neural City.

    Calculates forces that determine building positions:
    - Semantic Gravity: Pulls similar tiles together
    - Operational Tension: Pulls frequent communicators together
    - Anchor Force: Pulls buildings back to district center

    Attributes:
        gravity_constant: Strength of semantic gravity (default 0.1)
        tension_constant: Strength of bridge tension (default 0.05)
        anchor_constant: Strength of anchor spring (default 0.02)
        migration_threshold: Force ratio to trigger migration (default 2.0)
        migration_duration: Seconds at threshold to migrate (default 10.0)
        flux_mode: When True, anchor force is greatly reduced
    """
    gravity_constant: float = 0.1
    tension_constant: float = 0.05
    anchor_constant: float = 0.02
    migration_threshold: float = 2.0
    migration_duration: float = 10.0
    flux_mode: bool = False

    buildings: Dict[str, BuildingState] = field(default_factory=dict)
    bridges: Dict[Tuple[str, str], int] = field(default_factory=lambda: defaultdict(int))
    similarities: Dict[Tuple[str, str], float] = field(default_factory=dict)

    _webmcp: Any = field(default=None, repr=False)

    def __post_init__(self):
        """Initialize collections after dataclass creation."""
        if not isinstance(self.bridges, defaultdict):
            self.bridges = defaultdict(int, self.bridges)

    def set_webmcp(self, webmcp):
        """Set WebMCP instance for broadcasting."""
        self._webmcp = webmcp

    def register_building(
        self,
        building_id: str,
        position: Tuple[float, float],
        district: str
    ) -> BuildingState:
        """
        Register or update a building in the engine.

        Args:
            building_id: Unique building identifier
            position: (x, y) position
            district: District name (cognitive/metabolic/substrate)

        Returns:
            The BuildingState object
        """
        anchor = DISTRICT_ANCHORS.get(district, (0.0, 0.0))

        state = BuildingState(
            building_id=building_id,
            position=position,
            district=district,
            anchor_position=anchor
        )

        self.buildings[building_id] = state
        logger.debug(f"Registered building {building_id} in {district} at {position}")
        return state

    def unregister_building(self, building_id: str):
        """
        Remove a building from the engine.

        Also cleans up associated bridges and similarities.
        """
        if building_id in self.buildings:
            del self.buildings[building_id]

        # Clean up bridges involving this building
        keys_to_remove = [
            k for k in self.bridges.keys()
            if building_id in k
        ]
        for key in keys_to_remove:
            del self.bridges[key]

        # Clean up similarities involving this building
        keys_to_remove = [
            k for k in self.similarities.keys()
            if building_id in k
        ]
        for key in keys_to_remove:
            del self.similarities[key]

        logger.debug(f"Unregistered building {building_id}")

    def register_bridge(self, from_id: str, to_id: str):
        """
        Register a communication bridge between buildings.

        Increments the bridge count each call.
        """
        # Use sorted tuple for consistent key
        key = (min(from_id, to_id), max(from_id, to_id))
        self.bridges[key] += 1
        logger.debug(f"Bridge {key} frequency: {self.bridges[key]}")

    def set_similarity(self, id1: str, id2: str, similarity: float):
        """
        Set semantic similarity between two buildings.

        Args:
            id1: First building ID
            id2: Second building ID
            similarity: Similarity score (0-1)
        """
        key = (min(id1, id2), max(id1, id2))
        self.similarities[key] = max(0.0, min(1.0, similarity))

    def calculate_gravity_force(
        self,
        building_id: str,
        other_id: str,
        similarity: float
    ) -> ForceVector:
        """
        Calculate semantic gravity force between two buildings.

        Higher similarity = stronger pull toward each other.
        Force magnitude = similarity * constant * (100 / distance)

        Args:
            building_id: Source building
            other_id: Target building
            similarity: Similarity score (0-1)

        Returns:
            ForceVector pointing from building_id toward other_id
        """
        if building_id not in self.buildings or other_id not in self.buildings:
            return ForceVector()

        b1 = self.buildings[building_id]
        b2 = self.buildings[other_id]

        # Direction from b1 to b2
        dx = b2.position[0] - b1.position[0]
        dy = b2.position[1] - b1.position[1]
        distance = math.sqrt(dx*dx + dy*dy)

        if distance == 0:
            return ForceVector()

        # Normalize direction
        nx, ny = dx / distance, dy / distance

        # Force magnitude = similarity * constant / distance (inverse-ish)
        # Cap distance effect to avoid extreme forces at close range
        effective_distance = max(distance, 50.0)
        magnitude = similarity * self.gravity_constant * (100.0 / effective_distance)

        return ForceVector(
            dx=nx * magnitude,
            dy=ny * magnitude,
            magnitude=magnitude
        )

    def calculate_tension_force(
        self,
        building_id: str,
        other_id: str
    ) -> ForceVector:
        """
        Calculate operational tension force from bridge frequency.

        More bridges = stronger pull.

        Args:
            building_id: Source building
            other_id: Target building

        Returns:
            ForceVector pointing from building_id toward other_id
        """
        if building_id not in self.buildings or other_id not in self.buildings:
            return ForceVector()

        b1 = self.buildings[building_id]
        b2 = self.buildings[other_id]

        key = (min(building_id, other_id), max(building_id, other_id))
        bridge_count = self.bridges.get(key, 0)

        if bridge_count == 0:
            return ForceVector()

        # Direction from b1 to b2
        dx = b2.position[0] - b1.position[0]
        dy = b2.position[1] - b1.position[1]
        distance = math.sqrt(dx*dx + dy*dy)

        if distance == 0:
            return ForceVector()

        # Normalize direction
        nx, ny = dx / distance, dy / distance

        # Force magnitude = bridge_count * constant
        magnitude = bridge_count * self.tension_constant

        return ForceVector(
            dx=nx * magnitude,
            dy=ny * magnitude,
            magnitude=magnitude
        )

    def calculate_anchor_force(self, building_id: str) -> ForceVector:
        """
        Calculate anchor spring force pulling building back to district center.

        In flux mode, this force is greatly reduced (10%).

        Args:
            building_id: Building to calculate force for

        Returns:
            ForceVector pointing toward district anchor
        """
        if building_id not in self.buildings:
            return ForceVector()

        building = self.buildings[building_id]
        dx = building.anchor_position[0] - building.position[0]
        dy = building.anchor_position[1] - building.position[1]
        distance = math.sqrt(dx*dx + dy*dy)

        if distance == 0:
            return ForceVector()

        # Normalize direction
        nx, ny = dx / distance, dy / distance

        # Anchor force is proportional to distance (spring)
        # Reduced in flux mode
        effective_constant = self.anchor_constant * (0.1 if self.flux_mode else 1.0)
        magnitude = distance * effective_constant

        return ForceVector(
            dx=nx * magnitude,
            dy=ny * magnitude,
            magnitude=magnitude
        )

    async def calculate_total_force(self, building_id: str) -> ForceVector:
        """
        Calculate the total force on a building from all sources.

        F_total = F_gravity + F_tension - F_anchor

        Also tracks foreign district forces for migration detection.

        Args:
            building_id: Building to calculate force for

        Returns:
            ForceVector with total force
        """
        if building_id not in self.buildings:
            return ForceVector()

        building = self.buildings[building_id]
        total = ForceVector()

        # Track foreign district forces for migration detection
        foreign_forces: Dict[str, float] = defaultdict(float)

        # Sum gravity and tension forces from all other buildings
        for other_id in self.buildings:
            if other_id == building_id:
                continue

            other = self.buildings[other_id]

            # Gravity force (semantic similarity)
            key = (min(building_id, other_id), max(building_id, other_id))
            similarity = self.similarities.get(key, 0.0)

            if similarity > 0:
                gravity = self.calculate_gravity_force(building_id, other_id, similarity)
                total = total + gravity

                # Track foreign force
                if other.district != building.district:
                    foreign_forces[other.district] += gravity.magnitude

            # Tension force (bridge frequency)
            tension = self.calculate_tension_force(building_id, other_id)
            total = total + tension

            if other.district != building.district:
                foreign_forces[other.district] += tension.magnitude

        # Subtract anchor force (pulls toward anchor, so subtract from total)
        anchor = self.calculate_anchor_force(building_id)
        total = total - anchor

        # Store foreign forces for migration detection
        building.foreign_forces = dict(foreign_forces)
        building.last_update = time.time()

        return total

    async def detect_migration(self, building_id: str) -> Optional[str]:
        """
        Detect if a building should migrate to a different district.

        Migration occurs when:
        foreign_force > 2 * anchor_force for 10+ seconds

        Args:
            building_id: Building to check

        Returns:
            Target district name if migration threshold met, else None
        """
        if building_id not in self.buildings:
            return None

        building = self.buildings[building_id]

        # Calculate anchor force magnitude
        anchor = self.calculate_anchor_force(building_id)
        anchor_magnitude = anchor.magnitude

        # Find strongest foreign district
        if not building.foreign_forces:
            building.migration_timer = 0.0
            return None

        strongest_district = max(building.foreign_forces, key=building.foreign_forces.get)
        strongest_force = building.foreign_forces[strongest_district]

        # Check threshold (foreign force > 2x anchor)
        if anchor_magnitude > 0 and strongest_force > self.migration_threshold * anchor_magnitude:
            building.migration_timer += 1.0  # Assuming 1s tick

            if building.migration_timer >= self.migration_duration:
                logger.info(f"Migration detected: {building_id} -> {strongest_district}")
                return strongest_district
        else:
            # Reset timer if below threshold
            building.migration_timer = 0.0

        return None

    async def get_drift_updates(self) -> Dict[str, ForceVector]:
        """
        Calculate drift (dx, dy) for all buildings.

        Returns:
            Dict of building_id -> ForceVector with total drift
        """
        drifts = {}

        for building_id in list(self.buildings.keys()):
            force = await self.calculate_total_force(building_id)
            drifts[building_id] = force

        return drifts

    async def get_migration_candidates(self) -> List[Tuple[str, str]]:
        """
        Find all buildings that should migrate.

        Returns:
            List of (building_id, target_district) tuples
        """
        migrations = []

        for building_id in list(self.buildings.keys()):
            target = await self.detect_migration(building_id)
            if target:
                migrations.append((building_id, target))

        return migrations

    async def update_from_memory_hub(self, memory_hub) -> None:
        """
        Update similarities from NeuralMemoryHub.

        Pulls recent similar events and updates force graph.

        Args:
            memory_hub: NeuralMemoryHub instance
        """
        for building_id in list(self.buildings.keys()):
            try:
                context = await memory_hub.get_collective_context(building_id)

                # Extract similar events
                for event in context.get("similar_events", []):
                    other_id = event.get("tile_id")
                    if other_id and other_id in self.buildings:
                        # Use confidence as similarity proxy
                        # In production, could use event_vector cosine similarity
                        similarity = event.get("confidence", 0.5)
                        self.set_similarity(building_id, other_id, similarity)

            except Exception as e:
                logger.debug(f"Failed to update similarities for {building_id}: {e}")

    def enter_flux_mode(self):
        """Enter flux mode - reduced anchor forces for major reorganization."""
        self.flux_mode = True
        logger.info("🌋 TectonicEngine entered FLUX mode")

    def exit_flux_mode(self):
        """Exit flux mode - normal anchor forces."""
        self.flux_mode = False
        logger.info("🏔️ TectonicEngine exited FLUX mode")


# Singleton instance
_engine: Optional[TectonicEngine] = None


def get_tectonic_engine() -> TectonicEngine:
    """Get the global TectonicEngine instance."""
    global _engine
    if _engine is None:
        _engine = TectonicEngine()
    return _engine
