"""
Migration Strategy Module for Infinite Map OS.

This module implements the migration strategy and zone classification system
for managing file placement and migration decisions based on access patterns.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Tuple, Optional, Set
import math
from enum import Enum


class Zone(Enum):
    """Zone classification for file locations."""
    HOT = "HOT"
    WARM = "WARM"
    TEMPERATE = "TEMPERATE"
    COOL = "COOL"
    COLD = "COLD"


@dataclass
class MigrationConfig:
    """
    Configuration for migration strategy.

    Attributes:
        hot_zone_radius: Hot zone radius in pixels from center (default: 128)
        warm_zone_radius: Warm zone radius in pixels (default: 384)
        temperate_zone_radius: Temperate zone radius in pixels (default: 768)
        cool_zone_radius: Cool zone radius in pixels (default: 1536)
        cold_zone_radius: Cold zone radius (grid edge, default: 2048)
        migration_threshold: Number of accesses to trigger migration (default: 10)
        fragmentation_threshold: Max fragmentation percentage allowed (default: 30)
        compact_hot_zone: Keep hot zone compact by prioritizing center (default: True)
        migration_cost_per_pixel: Time in microseconds per pixel moved (default: 10)
        min_migration_benefit: Minimum benefit score to justify migration (default: 50)
    """
    hot_zone_radius: int = 128
    warm_zone_radius: int = 384
    temperate_zone_radius: int = 768
    cool_zone_radius: int = 1536
    cold_zone_radius: int = 2048

    # Migration thresholds
    migration_threshold: int = 10
    fragmentation_threshold: float = 0.3  # 30%
    compact_hot_zone: bool = True

    # Cost estimation
    migration_cost_per_pixel: float = 10.0  # microseconds per pixel
    min_migration_benefit: int = 50

    # Zone priority weights (higher = more desirable)
    zone_weights: Dict[str, int] = field(default_factory=lambda: {
        Zone.HOT.value: 100,
        Zone.WARM.value: 80,
        Zone.TEMPERATE.value: 60,
        Zone.COOL.value: 40,
        Zone.COLD.value: 20
    })

    def __post_init__(self):
        """Validate zone radii are in ascending order."""
        radii = [
            self.hot_zone_radius,
            self.warm_zone_radius,
            self.temperate_zone_radius,
            self.cool_zone_radius,
            self.cold_zone_radius
        ]
        if radii != sorted(radii):
            raise ValueError("Zone radii must be in ascending order")


@dataclass
class MigrationCandidate:
    """
    Represents a file candidate for migration.

    Attributes:
        path: File path
        current_location: Current (x, y) coordinates
        current_zone: Current zone classification
        access_count: Number of accesses recorded
        size_bytes: File size in bytes
        last_access: Last access timestamp
    """
    path: str
    current_location: Tuple[int, int]
    current_zone: str
    access_count: int
    size_bytes: int
    last_access: float

    def __lt__(self, other):
        """Compare candidates for priority sorting (lower priority = higher urgency)."""
        return self.priority < other.priority

    @property
    def priority(self) -> int:
        """Calculate migration priority (lower = higher priority)."""
        # Priority is inverted: higher priority value = lower actual priority
        return 1000 - self.access_count


@dataclass
class MigrationCost:
    """
    Estimated cost of a migration operation.

    Attributes:
        distance: Euclidean distance in pixels
        bytes_to_move: Number of bytes to migrate
        estimated_time_us: Estimated time in microseconds
        priority: Priority score (0 = highest priority)
    """
    distance: float
    bytes_to_move: int
    estimated_time_us: float
    priority: int


@dataclass
class MigrationBatch:
    """
    A batch of migration candidates to be processed together.

    Attributes:
        candidates: List of migration candidates in this batch
        total_bytes: Total bytes to migrate
        total_distance: Total distance to move all candidates
        estimated_time_us: Total estimated time in microseconds
    """
    candidates: List[MigrationCandidate]
    total_bytes: int
    total_distance: float
    estimated_time_us: float

    def __len__(self):
        return len(self.candidates)


class MigrationStrategy:
    """
    Core migration logic for zone-based file placement and migration decisions.

    The migration strategy manages file placement across spatial zones based on
    access frequency and current location. Hot files migrate toward center,
    cold files migrate toward edges.
    """

    def __init__(self, config: Optional[MigrationConfig] = None, center: Tuple[int, int] = (1024, 1024)):
        """
        Initialize migration strategy.

        Args:
            config: Migration configuration (uses default if None)
            center: Center point of the grid (default: 1024, 1024)
        """
        self.config = config or MigrationConfig()
        self.center = center
        self._occupied_locations: Set[Tuple[int, int]] = set()

    def classify_location(self, x: int, y: int) -> str:
        """
        Classify a location into a zone based on distance from center.

        Args:
            x: X coordinate
            y: Y coordinate

        Returns:
            Zone name: "HOT", "WARM", "TEMPERATE", "COOL", or "COLD"
        """
        distance = math.sqrt((x - self.center[0])**2 + (y - self.center[1])**2)

        if distance <= self.config.hot_zone_radius:
            return Zone.HOT.value
        elif distance <= self.config.warm_zone_radius:
            return Zone.WARM.value
        elif distance <= self.config.temperate_zone_radius:
            return Zone.TEMPERATE.value
        elif distance <= self.config.cool_zone_radius:
            return Zone.COOL.value
        else:
            return Zone.COLD.value

    def get_migration_priority(self, path: str, zone: str, access_count: int) -> int:
        """
        Calculate migration priority based on zone and access frequency.

        Lower values indicate higher priority (0 = highest priority).

        Args:
            path: File path (for future path-based scoring)
            zone: Current zone classification
            access_count: Number of accesses recorded

        Returns:
            Priority score (0 = highest, higher = lower priority)
        """
        # Base priority from zone weight
        zone_weight = self.config.zone_weights.get(zone, 0)

        # Invert: higher weight should mean lower priority value
        base_priority = 100 - zone_weight

        # Apply access frequency boost
        # Higher access count = higher priority (lower value)
        access_boost = min(access_count * 5, 50)  # Max boost of 50

        priority = max(0, base_priority - access_boost)

        return priority

    def should_migrate(self, path: str, zone: str, access_count: int) -> bool:
        """
        Determine if a file should be migrated based on threshold and zone.

        Files in outer zones with high access counts should migrate inward.
        Files in inner zones with low access counts may migrate outward.

        Args:
            path: File path
            zone: Current zone classification
            access_count: Number of accesses recorded

        Returns:
            True if migration is recommended, False otherwise
        """
        # Always migrate if access count exceeds threshold
        if access_count >= self.config.migration_threshold:
            # Migrate inward if not already in HOT zone
            if zone != Zone.HOT.value:
                return True

        # Migrate outward from HOT zone if low access
        if zone == Zone.HOT.value and access_count < self.config.migration_threshold // 2:
            return True

        return False

    def calculate_target_location(
        self,
        current: Tuple[int, int],
        access_count: int,
        file_size: int,
        occupied: Optional[Set[Tuple[int, int]]] = None
    ) -> Tuple[int, int]:
        """
        Calculate optimal target location for a file based on access frequency.

        High access files move toward center; low access files move outward.
        Uses spiral search to find available location.

        Args:
            current: Current (x, y) coordinates
            access_count: Number of accesses
            file_size: File size in bytes (for future multi-cluster support)
            occupied: Set of occupied locations to avoid (defaults to internal set)

        Returns:
            Target (x, y) coordinates
        """
        occupied = occupied or self._occupied_locations

        # Determine target distance from center based on access count
        # More accesses = closer to center
        target_distance = self._calculate_target_distance(access_count)

        # Calculate direction from center
        dx = current[0] - self.center[0]
        dy = current[1] - self.center[1]
        current_distance = math.sqrt(dx**2 + dy**2)

        # Calculate ideal target position
        if current_distance > 0:
            # Move along radial line toward/away from center
            scale_factor = target_distance / current_distance
            ideal_x = int(self.center[0] + dx * scale_factor)
            ideal_y = int(self.center[1] + dy * scale_factor)
        else:
            # Already at center, find nearby spot
            ideal_x, ideal_y = self.center[0] + 1, self.center[1] + 1

        # Spiral search for available location starting from ideal position
        return self._spiral_search(ideal_x, ideal_y, occupied, target_distance)

    def _calculate_target_distance(self, access_count: int) -> float:
        """
        Calculate target distance from center based on access count.

        Args:
            access_count: Number of accesses

        Returns:
            Target distance in pixels
        """
        # Map access count to zone radius
        # 0-5 accesses -> COLD zone
        # 5-10 accesses -> COOL zone
        # 10-20 accesses -> TEMPERATE zone
        # 20-50 accesses -> WARM zone
        # 50+ accesses -> HOT zone

        if access_count >= 50:
            # HOT zone: random within hot radius
            return self.config.hot_zone_radius * 0.7
        elif access_count >= 20:
            # WARM zone
            return (self.config.hot_zone_radius + self.config.warm_zone_radius) / 2
        elif access_count >= 10:
            # TEMPERATE zone
            return (self.config.warm_zone_radius + self.config.temperate_zone_radius) / 2
        elif access_count >= 5:
            # COOL zone
            return (self.config.temperate_zone_radius + self.config.cool_zone_radius) / 2
        else:
            # COLD zone
            return (self.config.cool_zone_radius + self.config.cold_zone_radius) / 2

    def _spiral_search(
        self,
        start_x: int,
        start_y: int,
        occupied: Set[Tuple[int, int]],
        target_distance: float,
        max_iterations: int = 1000
    ) -> Tuple[int, int]:
        """
        Search for available location using spiral pattern from start position.

        Args:
            start_x: Starting X coordinate
            start_y: Starting Y coordinate
            occupied: Set of occupied locations
            target_distance: Target distance from center (for scoring)
            max_iterations: Maximum search iterations

        Returns:
            Available (x, y) coordinates
        """
        best_location = (start_x, start_y)
        best_score = float('inf')

        # Clamp start position to valid bounds
        max_coord = self.config.cold_zone_radius * 2
        x = max(0, min(start_x, max_coord - 1))
        y = max(0, min(start_y, max_coord - 1))

        # Spiral search pattern: right, down, left, up, expanding
        dx, dy = 1, 0
        segment_length = 1
        segment_passed = 0
        segments_in_cycle = 0

        for i in range(max_iterations):
            # Check bounds
            if 0 <= x < max_coord and 0 <= y < max_coord:

                if (x, y) not in occupied:
                    # Score by distance to target distance
                    actual_distance = math.sqrt((x - self.center[0])**2 + (y - self.center[1])**2)
                    score = abs(actual_distance - target_distance)

                    if score < best_score:
                        best_score = score
                        best_location = (x, y)

                        # Return if very close to target
                        if score < 10:
                            return best_location

            # Move to next position
            x += dx
            y += dy
            segment_passed += 1

            # Change direction after completing segment
            if segment_passed >= segment_length:
                segment_passed = 0
                segments_in_cycle += 1

                # Rotate direction: right -> down -> left -> up -> right
                if dx == 1:
                    dx, dy = 0, 1  # Down
                elif dy == 1:
                    dx, dy = -1, 0  # Left
                elif dx == -1:
                    dx, dy = 0, -1  # Up
                elif dy == -1:
                    dx, dy = 1, 0  # Right

                # Increase segment length every 2 direction changes
                if segments_in_cycle >= 2:
                    segments_in_cycle = 0
                    segment_length += 1

        return best_location

    def estimate_migration_cost(
        self,
        old_location: Tuple[int, int],
        new_location: Tuple[int, int],
        file_size: int
    ) -> MigrationCost:
        """
        Estimate the cost of a migration operation.

        Args:
            old_location: Current (x, y) coordinates
            new_location: Target (x, y) coordinates
            file_size: File size in bytes

        Returns:
            MigrationCost with distance, bytes, estimated time, and priority
        """
        # Calculate Euclidean distance
        distance = math.sqrt(
            (new_location[0] - old_location[0])**2 +
            (new_location[1] - old_location[1])**2
        )

        # Estimate time based on distance and file size
        # Time = (distance pixels * cost_per_pixel) + (file_size / bytes_per_ms)
        base_time = distance * self.config.migration_cost_per_pixel
        size_time = file_size / 1024  # 1ms per KB
        total_time = base_time + size_time

        # Calculate priority based on distance (shorter distance = higher priority)
        # Normalize to 0-100 range
        max_distance = self.config.cold_zone_radius * math.sqrt(2)
        priority = int((distance / max_distance) * 100)

        return MigrationCost(
            distance=distance,
            bytes_to_move=file_size,
            estimated_time_us=total_time,
            priority=priority
        )

    def select_migration_batch(
        self,
        candidates: List[MigrationCandidate],
        limits: Optional[Dict[str, int]] = None
    ) -> MigrationBatch:
        """
        Select optimal batch of migrations from candidates.

        Prioritizes high-access files in outer zones, and low-access files
        in inner zones (defragmentation).

        Args:
            candidates: List of potential migration candidates
            limits: Optional limits {'max_count': int, 'max_bytes': int, 'max_time_us': float}

        Returns:
            MigrationBatch with selected candidates and total cost
        """
        if not candidates:
            return MigrationBatch([], 0, 0.0, 0.0)

        # Set default limits
        limits = limits or {}
        max_count = limits.get('max_count', 100)
        max_bytes = limits.get('max_bytes', 1024 * 1024)  # 1MB default
        max_time_us = limits.get('max_time_us', 100000.0)  # 100ms default

        # Score candidates by priority
        scored_candidates = []
        for candidate in candidates:
            priority = self.get_migration_priority(
                candidate.path,
                candidate.current_zone,
                candidate.access_count
            )

            # Calculate migration cost
            target = self.calculate_target_location(
                candidate.current_location,
                candidate.access_count,
                candidate.size_bytes
            )
            cost = self.estimate_migration_cost(
                candidate.current_location,
                target,
                candidate.size_bytes
            )

            # Benefit score: priority (inverted) + access boost
            benefit = (1000 - priority) + candidate.access_count * 2

            scored_candidates.append((candidate, target, cost, benefit))

        # Sort by benefit (highest first)
        scored_candidates.sort(key=lambda x: -x[3])

        # Select batch within limits
        selected = []
        total_bytes = 0
        total_distance = 0.0
        total_time = 0.0

        for candidate, target, cost, benefit in scored_candidates:
            # Check limits
            if len(selected) >= max_count:
                break
            if total_bytes + candidate.size_bytes > max_bytes:
                break
            if total_time + cost.estimated_time_us > max_time_us:
                break

            # Check minimum benefit threshold
            if benefit < self.config.min_migration_benefit:
                continue

            selected.append(candidate)
            total_bytes += candidate.size_bytes
            total_distance += cost.distance
            total_time += cost.estimated_time_us

        return MigrationBatch(
            candidates=selected,
            total_bytes=total_bytes,
            total_distance=total_distance,
            estimated_time_us=total_time
        )

    def add_occupied_location(self, x: int, y: int) -> None:
        """Add a location to the occupied set."""
        self._occupied_locations.add((x, y))

    def remove_occupied_location(self, x: int, y: int) -> None:
        """Remove a location from the occupied set."""
        self._occupied_locations.discard((x, y))

    def clear_occupied_locations(self) -> None:
        """Clear all occupied locations."""
        self._occupied_locations.clear()

    def set_occupied_locations(self, locations: Set[Tuple[int, int]]) -> None:
        """Set the entire occupied locations set."""
        self._occupied_locations = set(locations)
