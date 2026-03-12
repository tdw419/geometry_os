"""
Spatial Index for Neural City - Performance Optimization

Provides O(1) spatial queries instead of O(n²) neighbor checks.
Uses a grid-based spatial hash for efficient neighbor finding.
"""

import math
from typing import Dict, List, Set, Tuple, Optional
from dataclasses import dataclass, field


@dataclass
class SpatialCell:
    """A cell in the spatial grid."""
    x: int
    y: int
    citizens: Set[str] = field(default_factory=set)


class SpatialIndex:
    """
    Grid-based spatial index for O(1) neighbor queries.

    Instead of checking every citizen against every other citizen (O(n²)),
    we use a spatial hash grid to find only nearby citizens (O(n)).

    Usage:
        index = SpatialIndex(width=1024, height=1024, cell_size=64)
        index.insert("citizen_1", 100, 100)
        neighbors = index.query_nearby(100, 100, radius=64)
    """

    def __init__(self, width: int, height: int, cell_size: int = 64):
        """
        Initialize spatial index.

        Args:
            width: World width in pixels
            height: World height in pixels
            cell_size: Size of each grid cell (should be >= max query radius)
        """
        self.width = width
        self.height = height
        self.cell_size = cell_size

        # Grid dimensions
        self.cols = math.ceil(width / cell_size)
        self.rows = math.ceil(height / cell_size)

        # Spatial hash: cell_key -> SpatialCell
        self.cells: Dict[str, SpatialCell] = {}

        # Citizen positions cache
        self.positions: Dict[str, Tuple[int, int]] = {}

        # Statistics
        self.stats = {
            'insertions': 0,
            'queries': 0,
            'avg_query_results': 0.0
        }

    def _cell_key(self, cx: int, cy: int) -> str:
        """Get cell key from cell coordinates."""
        return f"{cx},{cy}"

    def _get_cell_coords(self, x: int, y: int) -> Tuple[int, int]:
        """Convert world coordinates to cell coordinates."""
        cx = max(0, min(self.cols - 1, x // self.cell_size))
        cy = max(0, min(self.rows - 1, y // self.cell_size))
        return cx, cy

    def _get_or_create_cell(self, cx: int, cy: int) -> SpatialCell:
        """Get or create a cell at the given coordinates."""
        key = self._cell_key(cx, cy)
        if key not in self.cells:
            self.cells[key] = SpatialCell(x=cx, y=cy)
        return self.cells[key]

    def insert(self, citizen_id: str, x: int, y: int):
        """
        Insert or update a citizen's position.

        Args:
            citizen_id: Unique citizen identifier
            x: X position in world coordinates
            y: Y position in world coordinates
        """
        # Remove from old cell if exists
        if citizen_id in self.positions:
            self.remove(citizen_id)

        # Get cell
        cx, cy = self._get_cell_coords(x, y)
        cell = self._get_or_create_cell(cx, cy)

        # Add to cell
        cell.citizens.add(citizen_id)
        self.positions[citizen_id] = (x, y)
        self.stats['insertions'] += 1

    def remove(self, citizen_id: str):
        """Remove a citizen from the index."""
        if citizen_id not in self.positions:
            return

        x, y = self.positions[citizen_id]
        cx, cy = self._get_cell_coords(x, y)
        key = self._cell_key(cx, cy)

        if key in self.cells:
            self.cells[key].citizens.discard(citizen_id)

        del self.positions[citizen_id]

    def update(self, citizen_id: str, x: int, y: int):
        """Update a citizen's position (alias for insert)."""
        self.insert(citizen_id, x, y)

    def query_nearby(self, x: int, y: int, radius: int = 64) -> List[str]:
        """
        Find all citizens within radius of point.

        Args:
            x: Query point X
            y: Query point Y
            radius: Search radius

        Returns:
            List of citizen IDs within radius
        """
        results = []

        # Calculate cell range to check
        min_cx = max(0, (x - radius) // self.cell_size)
        max_cx = min(self.cols - 1, (x + radius) // self.cell_size)
        min_cy = max(0, (y - radius) // self.cell_size)
        max_cy = min(self.rows - 1, (y + radius) // self.cell_size)

        radius_sq = radius * radius

        # Check all cells in range
        for cy in range(min_cy, max_cy + 1):
            for cx in range(min_cx, max_cx + 1):
                key = self._cell_key(cx, cy)
                if key not in self.cells:
                    continue

                cell = self.cells[key]
                for citizen_id in cell.citizens:
                    # Check actual distance
                    cx_pos, cy_pos = self.positions[citizen_id]
                    dist_sq = (cx_pos - x) ** 2 + (cy_pos - y) ** 2
                    if dist_sq <= radius_sq:
                        results.append(citizen_id)

        # Update stats
        self.stats['queries'] += 1
        n = len(results)
        self.stats['avg_query_results'] = (
            self.stats['avg_query_results'] * (self.stats['queries'] - 1) + n
        ) / self.stats['queries']

        return results

    def query_cell(self, cx: int, cy: int) -> Set[str]:
        """Get all citizens in a specific cell."""
        key = self._cell_key(cx, cy)
        if key in self.cells:
            return self.cells[key].citizens.copy()
        return set()

    def query_rect(self, x1: int, y1: int, x2: int, y2: int) -> List[str]:
        """
        Find all citizens within a rectangle.

        Args:
            x1, y1: Top-left corner
            x2, y2: Bottom-right corner

        Returns:
            List of citizen IDs in rectangle
        """
        results = []

        min_cx = max(0, x1 // self.cell_size)
        max_cx = min(self.cols - 1, x2 // self.cell_size)
        min_cy = max(0, y1 // self.cell_size)
        max_cy = min(self.rows - 1, y2 // self.cell_size)

        for cy in range(min_cy, max_cy + 1):
            for cx in range(min_cx, max_cx + 1):
                key = self._cell_key(cx, cy)
                if key not in self.cells:
                    continue

                cell = self.cells[key]
                for citizen_id in cell.citizens:
                    px, py = self.positions[citizen_id]
                    if x1 <= px <= x2 and y1 <= py <= y2:
                        results.append(citizen_id)

        return results

    def get_density_map(self) -> Dict[Tuple[int, int], int]:
        """
        Get population density per cell.

        Returns:
            Dict mapping (cx, cy) -> citizen count
        """
        density = {}
        for key, cell in self.cells.items():
            if cell.citizens:
                density[(cell.x, cell.y)] = len(cell.citizens)
        return density

    def get_hot_cells(self, threshold: int = 5) -> List[Tuple[int, int, int]]:
        """
        Find cells with high citizen density.

        Args:
            threshold: Minimum citizens to be considered "hot"

        Returns:
            List of (cx, cy, count) tuples
        """
        hot = []
        for key, cell in self.cells.items():
            count = len(cell.citizens)
            if count >= threshold:
                hot.append((cell.x, cell.y, count))
        return sorted(hot, key=lambda x: x[2], reverse=True)

    def clear(self):
        """Clear all citizens from the index."""
        self.cells.clear()
        self.positions.clear()

    def get_stats(self) -> Dict:
        """Get spatial index statistics."""
        return {
            **self.stats,
            'total_citizens': len(self.positions),
            'total_cells': len(self.cells),
            'grid_size': f"{self.cols}x{self.rows}",
            'cell_size': self.cell_size
        }


class OptimizedNeighborFinder:
    """
    Optimized neighbor finding using spatial indexing.

    Provides batch neighbor finding for all citizens efficiently.
    """

    def __init__(self, width: int, height: int, cell_size: int = 64):
        self.index = SpatialIndex(width, height, cell_size)
        self.neighbor_cache: Dict[str, List[str]] = {}
        self.cache_valid = False

    def rebuild(self, citizens: Dict[str, any]):
        """
        Rebuild the spatial index from citizens dict.

        Args:
            citizens: Dict of citizen_id -> citizen object with x, y attributes
        """
        self.index.clear()

        for citizen_id, citizen in citizens.items():
            self.index.insert(citizen_id, citizen.x, citizen.y)

        self.cache_valid = False

    def find_neighbors(self, citizen_id: str, x: int, y: int, radius: int = 64) -> List[str]:
        """
        Find neighbors for a single citizen.

        Args:
            citizen_id: The citizen to find neighbors for
            x: Citizen's X position
            y: Citizen's Y position
            radius: Neighbor search radius

        Returns:
            List of neighbor citizen IDs (excluding self)
        """
        nearby = self.index.query_nearby(x, y, radius)
        return [cid for cid in nearby if cid != citizen_id]

    def find_all_neighbors(self, citizens: Dict[str, any], radius: int = 64) -> Dict[str, List[str]]:
        """
        Find neighbors for all citizens efficiently.

        Args:
            citizens: Dict of citizen_id -> citizen object
            radius: Neighbor search radius

        Returns:
            Dict mapping citizen_id -> list of neighbor IDs
        """
        if not self.cache_valid:
            self.rebuild(citizens)

        neighbors = {}
        for citizen_id, citizen in citizens.items():
            neighbors[citizen_id] = self.find_neighbors(
                citizen_id, citizen.x, citizen.y, radius
            )

        return neighbors

    def get_nearby_pairs(self, radius: int = 64) -> List[Tuple[str, str, float]]:
        """
        Find all pairs of citizens within radius.

        Args:
            radius: Maximum distance for pairs

        Returns:
            List of (id1, id2, distance) tuples
        """
        pairs = []
        checked = set()

        for citizen_id, (x, y) in self.index.positions.items():
            nearby = self.index.query_nearby(x, y, radius)

            for other_id in nearby:
                if other_id == citizen_id:
                    continue

                # Avoid duplicates
                pair_key = tuple(sorted([citizen_id, other_id]))
                if pair_key in checked:
                    continue
                checked.add(pair_key)

                # Calculate exact distance
                ox, oy = self.index.positions[other_id]
                dist = math.sqrt((x - ox) ** 2 + (y - oy) ** 2)

                if dist <= radius:
                    pairs.append((citizen_id, other_id, dist))

        return pairs
