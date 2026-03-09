"""
Tectonic: File Gravity Engine
Force-directed layout for the Geometry OS infinite map.
"""

import numpy as np
import time
import json
import os
from typing import Dict, Any, List, Tuple

class GravityEngine:
    def __init__(
        self,
        bounds: Tuple[int, int] = (1024, 1024),
        use_quadtree: bool = True,
        quadtree_threshold: int = 50,
        theta: float = 0.5
    ):
        self.bounds = bounds
        self.orbs: Dict[str, Dict[str, Any]] = {}

        # Physics Constants
        self.k_spring = 0.05    # Attractive force strength
        self.k_repel = 1000.0   # Repulsive force strength
        self.friction = 0.9     # Velocity damping
        self.dt = 0.1           # Simulation timestep

        # Barnes-Hut acceleration for O(N log N) scaling
        self.use_quadtree = use_quadtree
        self.quadtree_threshold = quadtree_threshold  # Use quadtree when N > threshold
        self.theta = theta  # Barnes-Hut opening angle
        self._quadtree = None  # Built each frame

        # Performance Tracking
        self.last_update = time.time()

    def add_orb(self, file_path: str, x: float, y: float, size: float):
        """Add a new file orb to the simulation."""
        self.orbs[file_path] = {
            "pos": np.array([x, y], dtype=np.float32),
            "vel": np.array([0.0, 0.0], dtype=np.float32),
            "mass": max(1.0, np.log10(size + 1)),
            "energy": 1.0,
            "links": [] # Paths of related files (imports)
        }

    def link_orbs(self, path_a: str, path_b: str):
        """Create an attractive spring between two orbs."""
        if path_a in self.orbs and path_b in self.orbs:
            if path_b not in self.orbs[path_a]["links"]:
                self.orbs[path_a]["links"].append(path_b)

    def update(self):
        """Advance the simulation by one timestep."""
        n_orbs = len(self.orbs)

        if n_orbs == 0:
            return

        # Choose algorithm based on orb count
        if self.use_quadtree and n_orbs > self.quadtree_threshold:
            self._update_quadtree()
        else:
            self._update_direct()

        self.last_update = time.time()

    def _update_direct(self):
        """O(N^2) direct force calculation (for small N)."""
        paths = list(self.orbs.keys())
        n = len(paths)
        if n < 2:
            return

        # Extract positions and velocities into NumPy arrays for batch processing
        pos = np.array([self.orbs[p]["pos"] for p in paths])
        vel = np.array([self.orbs[p]["vel"] for p in paths])
        mass = np.array([self.orbs[p]["mass"] for p in paths])

        forces = np.zeros_like(pos)

        # 1. Calculate Repulsive Forces (All-pairs)
        for i in range(n):
            diff = pos[i] - pos
            dist_sq = np.sum(diff**2, axis=1) + 0.01  # Avoid div by zero
            # Coulomb-like repulsion: F = k / r^2
            repel = (self.k_repel / dist_sq)[:, np.newaxis] * diff
            forces[i] += np.sum(repel, axis=0)

        # 2. Calculate Attractive Forces (Links)
        for i, path in enumerate(paths):
            for linked_path in self.orbs[path]["links"]:
                if linked_path in self.orbs:
                    j = paths.index(linked_path)
                    diff = pos[j] - pos[i]
                    # Hooke's Law: F = k * r
                    forces[i] += self.k_spring * diff
                    forces[j] -= self.k_spring * diff

        # 3. Apply Update (Euler Integration)
        # a = F / m
        accel = forces / mass[:, np.newaxis]
        vel = (vel + accel * self.dt) * self.friction
        pos = pos + vel * self.dt

        # Constrain to bounds
        pos = np.clip(pos, [0, 0], self.bounds)

        # Update internal state
        for i, path in enumerate(paths):
            self.orbs[path]["pos"] = pos[i]
            self.orbs[path]["vel"] = vel[i]

    def _update_quadtree(self):
        """O(N log N) Barnes-Hut force calculation (for large N)."""
        from .quadtree import QuadTree

        # Build quadtree
        self._quadtree = QuadTree(self.bounds[0], self.bounds[1], theta=self.theta)

        for path, orb in self.orbs.items():
            self._quadtree.insert(
                orb["pos"][0],
                orb["pos"][1],
                orb["mass"],
                {"path": path}
            )

        # Calculate forces using quadtree
        for path, orb in self.orbs.items():
            x, y = orb["pos"]

            # Repulsive force from quadtree approximation
            fx, fy = self._quadtree.calculate_force(x, y, self.theta, self.k_repel)

            # Handle case where force calculation returns None (empty tree)
            if fx is None:
                fx, fy = 0.0, 0.0

            # Add spring forces for linked orbs (direct, not approximated)
            for linked_path in orb["links"]:
                if linked_path in self.orbs:
                    other = self.orbs[linked_path]
                    diff = orb["pos"] - other["pos"]
                    dist = np.sqrt(np.sum(diff ** 2))
                    if dist < 1.0:
                        dist = 1.0
                    force = -self.k_spring * dist
                    force_dir = diff / dist
                    fx += force * force_dir[0]
                    fy += force * force_dir[1]

            # Integrate
            accel = np.array([fx, fy]) / orb["mass"]
            orb["vel"] = (orb["vel"] + accel * self.dt) * self.friction
            orb["pos"] = orb["pos"] + orb["vel"] * self.dt

            # Boundary constraints
            orb["pos"][0] = np.clip(orb["pos"][0], 0, self.bounds[0])
            orb["pos"][1] = np.clip(orb["pos"][1], 0, self.bounds[1])

    def get_updates(self) -> List[Dict[str, Any]]:
        """Return changed positions for the compositor."""
        updates = []
        for path, data in self.orbs.items():
            updates.append({
                "path": path,
                "x": float(data["pos"][0]),
                "y": float(data["pos"][1]),
                "velocity": float(np.linalg.norm(data["vel"]))
            })
        return updates

    def update_mass(self, file_path: str, delta: float):
        """
        Update the mass of an orb by a delta amount.

        Args:
            file_path: Path of the orb to update
            delta: Amount to add to mass (can be negative)
        """
        if file_path in self.orbs:
            self.orbs[file_path]["mass"] += delta
            # Ensure mass doesn't go below minimum
            self.orbs[file_path]["mass"] = max(0.1, self.orbs[file_path]["mass"])

    def set_mass(self, file_path: str, mass: float):
        """
        Set the mass of an orb directly.

        Args:
            file_path: Path of the orb to update
            mass: New mass value
        """
        if file_path in self.orbs:
            self.orbs[file_path]["mass"] = max(0.1, mass)

    def get_mass(self, file_path: str) -> float:
        """Get the mass of an orb."""
        if file_path in self.orbs:
            return self.orbs[file_path]["mass"]
        return 0.0

if __name__ == "__main__":
    engine = GravityEngine()
    print("Testing Gravity Engine with 3 Orbs...")
    engine.add_orb("file_a.py", 100, 100, 1024)
    engine.add_orb("file_b.py", 110, 110, 2048)
    engine.add_orb("file_c.py", 500, 500, 512)
    engine.link_orbs("file_a.py", "file_b.py")
    
    for i in range(10):
        engine.update()
        print(f"Step {i} Updates: {len(engine.get_updates())} orbs moving.")
    
    print("Gravity Engine Simulation Stable.")
