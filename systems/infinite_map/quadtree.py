"""
Barnes-Hut Quadtree for O(N log N) Force Calculation

Implements spatial partitioning that enables the Tectonic GravityEngine
to scale from thousands to millions of orbs.

Barnes-Hut Algorithm:
- Build quadtree from all particle positions
- For each particle, calculate forces using approximation:
  - If node is well-separated (s/d < theta), use center-of-mass
  - Otherwise, recurse into children
- Reduces O(N^2) all-pairs to O(N log N)
"""

from dataclasses import dataclass
from typing import Optional, List, Tuple, Dict, Any


@dataclass
class BoundingBox:
    """
    Axis-aligned bounding box for quadtree nodes.

    Coordinate system:
    - (x, y) is the top-left corner
    - width extends right (positive x)
    - height extends down (positive y, screen coordinates)
    """
    x: float
    y: float
    width: float
    height: float

    def contains_point(self, px: float, py: float) -> bool:
        """Check if point (px, py) is within this bounding box."""
        return (self.x <= px < self.x + self.width and
                self.y <= py < self.y + self.height)

    def quadrant(self, px: float, py: float) -> int:
        """
        Determine which quadrant a point belongs to.

        Returns:
            0 = NW (top-left)
            1 = NE (top-right)
            2 = SW (bottom-left)
            3 = SE (bottom-right)
        """
        cx = self.x + self.width / 2
        cy = self.y + self.height / 2

        if px < cx:
            if py < cy:
                return 0  # NW
            else:
                return 2  # SW
        else:
            if py < cy:
                return 1  # NE
            else:
                return 3  # SE

    def child_box(self, quadrant: int) -> 'BoundingBox':
        """Return the bounding box for the specified child quadrant."""
        hw = self.width / 2
        hh = self.height / 2

        if quadrant == 0:  # NW
            return BoundingBox(self.x, self.y, hw, hh)
        elif quadrant == 1:  # NE
            return BoundingBox(self.x + hw, self.y, hw, hh)
        elif quadrant == 2:  # SW
            return BoundingBox(self.x, self.y + hh, hw, hh)
        else:  # SE
            return BoundingBox(self.x + hw, self.y + hh, hw, hh)


class QuadNode:
    """
    A node in the quadtree.

    Leaf nodes contain particles.
    Internal nodes contain children (4 quadrants).

    Tracks center_of_mass and total_mass for Barnes-Hut approximation.
    """

    def __init__(self, bounds: BoundingBox, capacity: int = 4):
        self.bounds = bounds
        self.capacity = capacity

        # Particles stored as list of (x, y, mass, data) tuples
        self.particles: List[Tuple[float, float, float, Any]] = []

        # Children: [NW, NE, SW, SE] or None if not subdivided
        self.children: Optional[List[Optional['QuadNode']]] = None

        # Barnes-Hut aggregation
        self.center_of_mass: Optional[Tuple[float, float]] = None
        self.total_mass: float = 0.0

    def is_subdivided(self) -> bool:
        """Check if this node has been subdivided."""
        return self.children is not None

    def is_leaf(self) -> bool:
        """Check if this is a leaf node (not subdivided)."""
        return self.children is None

    def subdivide(self):
        """
        Subdivide this node into 4 quadrants.
        Moves existing particles to children.
        """
        if self.is_subdivided():
            return

        # Create 4 child nodes
        self.children = [
            QuadNode(self.bounds.child_box(0), self.capacity),  # NW
            QuadNode(self.bounds.child_box(1), self.capacity),  # NE
            QuadNode(self.bounds.child_box(2), self.capacity),  # SW
            QuadNode(self.bounds.child_box(3), self.capacity),  # SE
        ]

        # Re-insert existing particles into children
        old_particles = self.particles
        self.particles = []

        for x, y, mass, data in old_particles:
            q = self.bounds.quadrant(x, y)
            if self.children[q] is not None:
                self.children[q].insert(x, y, mass, data)

    def insert(self, x: float, y: float, mass: float, data: Any) -> bool:
        """
        Insert a particle into this node.

        Returns:
            True if inserted successfully, False if point out of bounds
        """
        # Check bounds
        if not self.bounds.contains_point(x, y):
            return False

        # Update center of mass (running weighted average)
        if self.total_mass == 0.0:
            self.center_of_mass = (x, y)
        else:
            new_mass = self.total_mass + mass
            new_cx = (self.center_of_mass[0] * self.total_mass + x * mass) / new_mass
            new_cy = (self.center_of_mass[1] * self.total_mass + y * mass) / new_mass
            self.center_of_mass = (new_cx, new_cy)
        self.total_mass += mass

        # If already subdivided, add to child
        if self.is_subdivided():
            q = self.bounds.quadrant(x, y)
            return self.children[q].insert(x, y, mass, data)

        # If leaf with room, add particle
        if len(self.particles) < self.capacity:
            self.particles.append((x, y, mass, data))
            return True

        # Need to subdivide
        self.subdivide()

        # Insert new particle into child
        q = self.bounds.quadrant(x, y)
        return self.children[q].insert(x, y, mass, data)

    def find_nearby(self, x: float, y: float, radius: float) -> List[Dict[str, Any]]:
        """
        Find all particles within radius of point (x, y).

        Returns:
            List of dicts with 'x', 'y', 'mass', 'data' keys
        """
        results = []

        # Check if this node's bounds could contain nearby points
        # Simple bounds check: if node center is too far, skip
        node_cx = self.bounds.x + self.bounds.width / 2
        node_cy = self.bounds.y + self.bounds.height / 2
        node_radius = (self.bounds.width + self.bounds.height) / 4  # Approximate

        dist_to_node = ((x - node_cx) ** 2 + (y - node_cy) ** 2) ** 0.5
        if dist_to_node - node_radius > radius:
            return results  # Node too far away

        # Check particles in this node
        for px, py, mass, data in self.particles:
            dist = ((x - px) ** 2 + (y - py) ** 2) ** 0.5
            if dist <= radius:
                results.append({'x': px, 'y': py, 'mass': mass, 'data': data})

        # Recurse into children
        if self.is_subdivided():
            for child in self.children:
                if child is not None:
                    results.extend(child.find_nearby(x, y, radius))

        return results


class QuadTree:
    """
    Barnes-Hut Quadtree for O(N log N) force calculation.

    Usage:
        tree = QuadTree(width=1024, height=1024, theta=0.5)
        tree.insert(x, y, mass, data)
        force = tree.calculate_force(px, py, theta=0.5)
    """

    def __init__(self, width: float, height: float, theta: float = 0.5, capacity: int = 4):
        self.width = width
        self.height = height
        self.theta = theta
        self.capacity = capacity

        bounds = BoundingBox(0, 0, width, height)
        self.root = QuadNode(bounds, capacity)

    def insert(self, x: float, y: float, mass: float, data: Any = None) -> bool:
        """Insert a particle into the quadtree."""
        return self.root.insert(x, y, mass, data)

    def find_nearby(self, x: float, y: float, radius: float) -> List[Dict[str, Any]]:
        """Find all particles within radius of (x, y)."""
        return self.root.find_nearby(x, y, radius)

    def calculate_force(self, x: float, y: float, theta: float = None,
                        k_repel: float = 1000.0) -> Optional[Tuple[float, float]]:
        """
        Calculate repulsive force at point (x, y) using Barnes-Hut approximation.

        Uses iterative (stack-based) traversal for safety.

        Args:
            x, y: Position to calculate force at
            theta: Barnes-Hut approximation threshold (s/d < theta)
            k_repel: Repulsive force constant

        Returns:
            (fx, fy) force vector, or None if tree is empty
        """
        if theta is None:
            theta = self.theta

        if self.root.total_mass == 0:
            return None

        fx, fy = 0.0, 0.0

        # Iterative traversal using stack
        stack = [self.root]

        while stack:
            node = stack.pop()

            if node.total_mass == 0:
                continue

            # Distance to node's center of mass
            com = node.center_of_mass
            if com is None:
                continue

            dx = com[0] - x
            dy = com[1] - y
            dist_sq = dx * dx + dy * dy
            dist = dist_sq ** 0.5

            # Avoid self-interaction and division by zero
            if dist < 0.01:
                continue

            # Node size (approximate as max dimension)
            size = max(node.bounds.width, node.bounds.height)

            # Barnes-Hut criterion: s/d < theta
            if node.is_leaf() or (size / dist < theta):
                # Use center-of-mass approximation
                # Coulomb-like repulsion: F = k * m / r^2
                # Direction: away from center of mass
                force_mag = k_repel * node.total_mass / (dist_sq + 0.01)
                fx -= force_mag * dx / dist
                fy -= force_mag * dy / dist
            else:
                # Need to recurse into children
                if node.children:
                    for child in node.children:
                        if child is not None and child.total_mass > 0:
                            stack.append(child)

        return (fx, fy)

    def count_approximations(self, x: float, y: float, theta: float = None) -> int:
        """
        Count how many times Barnes-Hut approximation was used.

        Useful for testing and understanding approximation behavior.
        """
        if theta is None:
            theta = self.theta

        if self.root.total_mass == 0:
            return 0

        count = 0
        stack = [self.root]

        while stack:
            node = stack.pop()

            if node.total_mass == 0:
                continue

            com = node.center_of_mass
            if com is None:
                continue

            dx = com[0] - x
            dy = com[1] - y
            dist = (dx * dx + dy * dy) ** 0.5

            if dist < 0.01:
                continue

            size = max(node.bounds.width, node.bounds.height)

            if node.is_leaf() or (size / dist < theta):
                count += 1
            else:
                if node.children:
                    for child in node.children:
                        if child is not None and child.total_mass > 0:
                            stack.append(child)

        return count

    def clear(self):
        """Clear all particles from the tree."""
        bounds = BoundingBox(0, 0, self.width, self.height)
        self.root = QuadNode(bounds, self.capacity)


if __name__ == "__main__":
    # Quick demo
    tree = QuadTree(width=1024, height=1024, theta=0.5)

    # Insert some particles
    import random
    for i in range(100):
        x = random.uniform(0, 1024)
        y = random.uniform(0, 1024)
        tree.insert(x, y, mass=1.0, data={"id": i})

    print(f"Total mass: {tree.root.total_mass}")
    print(f"Center of mass: {tree.root.center_of_mass}")

    # Calculate force at center
    force = tree.calculate_force(512, 512)
    print(f"Force at (512, 512): {force}")

    # Count approximations
    approx = tree.count_approximations(100, 100)
    print(f"Approximations used: {approx}")
