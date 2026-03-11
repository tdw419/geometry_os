"""
Tectonic: File Gravity Engine (3D Holographic Edition)
Force-directed layout for the Geometry OS infinite map.
"""

import logging
import time
from collections.abc import Callable
from enum import Enum
from typing import Any

import numpy as np

from systems.infinite_map.quadtree import QuadTree

logger = logging.getLogger(__name__)


class CollisionMode(Enum):
    """Collision handling modes."""
    NONE = "none"
    MERGE = "merge"
    BOUNCE = "bounce"


class GravityEngine:
    def __init__(
        self,
        bounds: tuple[int, int, int] = (1024, 1024, 256),
        use_quadtree: bool = True,
        quadtree_threshold: int = 50,
        theta: float = 0.5,
        collision_mode: str = "none",
        collision_threshold: float = 10.0,
        visual_bridge: Any | None = None
    ):
        self.bounds = bounds
        self.orbs: dict[str, dict[str, Any]] = {}

        # Physics Constants
        self.k_spring = 0.05    # Attractive force strength
        self.k_repel = 1500.0   # Repulsive force strength (increased for 3D)
        self.k_layer = 0.1      # Z-axis Layer Affinity strength (Restoring force)
        self.friction = 0.85    # Velocity damping (increased for stability)
        self.dt = 0.1           # Simulation timestep

        # Quadtree acceleration (Barnes-Hut)
        self.use_quadtree = use_quadtree
        self.quadtree_threshold = quadtree_threshold
        self.theta = theta

        # Collision handling
        self.collision_mode = CollisionMode(collision_mode)
        self.collision_threshold = collision_threshold  # Hilbert units (10 default)
        self.collision_events: list[dict[str, Any]] = []  # Recent collision events
        self._collision_callbacks: list[Callable] = []

        # Visual bridge for emitting collision events
        self.visual_bridge = visual_bridge

        # Momentary physical impulses (Expansion waves / Void collapse)
        self.ripples: list[dict[str, Any]] = []

        # Performance Tracking
        self.last_update = time.time()

    def add_orb(self, file_path: str, x: float, y: float, z: float, size: float, target_z: float = None):
        """
        Add a new file orb to the 3D simulation.
        target_z: The semantic layer depth (0-255). Defaults to initial z.
        """
        self.orbs[file_path] = {
            "pos": np.array([x, y, z], dtype=np.float32),
            "vel": np.array([0.0, 0.0, 0.0], dtype=np.float32),
            "target_z": target_z if target_z is not None else z,
            "mass": max(1.0, np.log10(size + 1)),
            "energy": 1.0,
            "links": []
        }

    def get_orb(self, file_path: str) -> dict[str, Any] | None:
        """Get the current state of an orb."""
        if file_path in self.orbs:
            data = self.orbs[file_path]
            return {
                "x": float(data["pos"][0]),
                "y": float(data["pos"][1]),
                "z": float(data["pos"][2]),
                "mass": float(data["mass"]),
                "velocity": float(np.linalg.norm(data["vel"]))
            }
        return None

    def emit_ripple(self, x: float, y: float, z: float, force: float, radius: float):
        """
        Emit a momentary physical impulse (ripple) at a 3D location.
        force: positive for repulsion (expansion), negative for attraction (collapse).
        """
        self.ripples.append({
            "pos": np.array([x, y, z], dtype=np.float32),
            "force": force,
            "radius": radius,
            "timestamp": time.time()
        })

    def link_orbs(self, path_a: str, path_b: str):
        """Create an attractive spring between two orbs in 3D."""
        if path_a in self.orbs and path_b in self.orbs:
            if path_b not in self.orbs[path_a]["links"]:
                self.orbs[path_a]["links"].append(path_b)

    def update(self):
        """Advance the 3D simulation by one timestep."""
        n_orbs = len(self.orbs)
        if n_orbs < 2 and not self.ripples:
            return

        # Choose algorithm based on particle count and settings
        if self.use_quadtree and n_orbs > self.quadtree_threshold:
            self._update_quadtree()
        else:
            self._update_direct()

        # Clear one-shot ripples after update
        self.ripples.clear()
        self.last_update = time.time()

    def _update_direct(self):
        """O(N^2) direct force calculation in 3D."""
        paths = list(self.orbs.keys())
        n = len(paths)

        # Extract batch arrays
        pos = np.array([self.orbs[p]["pos"] for p in paths])
        vel = np.array([self.orbs[p]["vel"] for p in paths])
        mass = np.array([self.orbs[p]["mass"] for p in paths])
        target_z = np.array([self.orbs[p]["target_z"] for p in paths])

        forces = np.zeros_like(pos)

        # 1. Repulsive Forces (3D Coulomb)
        for i in range(n):
            diff = pos[i] - pos
            dist_sq = np.sum(diff**2, axis=1) + 0.01
            repel = (self.k_repel / dist_sq)[:, np.newaxis] * diff
            forces[i] += np.sum(repel, axis=0)

        # 2. Attractive Forces (3D Springs)
        for i, path in enumerate(paths):
            for linked_path in self.orbs[path]["links"]:
                if linked_path in self.orbs:
                    j = paths.index(linked_path)
                    diff = pos[j] - pos[i]
                    forces[i] += self.k_spring * diff
                    forces[j] -= self.k_spring * diff

        # 3. Z-Axis Layer Affinity (Restoring Force)
        # Pulls orb towards its target semantic depth
        z_diff = target_z - pos[:, 2]
        forces[:, 2] += self.k_layer * z_diff

        # 4. Ripple Forces (Momentary Impulses)
        for ripple in self.ripples:
            diff = pos - ripple["pos"]
            dist_sq = np.sum(diff**2, axis=1) + 0.01
            dist = np.sqrt(dist_sq)

            # Mask orbs within radius
            mask = dist < ripple["radius"]
            if np.any(mask):
                # Force magnitude decays with distance (inverse square)
                magnitude = ripple["force"] / dist_sq
                # Apply force in direction of diff (repulsion if force > 0)
                ripple_forces = magnitude[:, np.newaxis] * diff
                forces[mask] += ripple_forces[mask]

        # 5. Integration
        accel = forces / mass[:, np.newaxis]
        vel = (vel + accel * self.dt) * self.friction
        pos = pos + vel * self.dt

        # Constrain to 3D bounds
        pos = np.clip(pos, [0, 0, 0], self.bounds)

        # Update internal state
        for i, path in enumerate(paths):
            self.orbs[path]["pos"] = pos[i]
            self.orbs[path]["vel"] = vel[i]

    def _update_quadtree(self):
        """O(N log N) Barnes-Hut force calculation using quadtree for XY plane."""
        paths = list(self.orbs.keys())
        n = len(paths)

        # Extract batch arrays
        pos = np.array([self.orbs[p]["pos"] for p in paths])
        vel = np.array([self.orbs[p]["vel"] for p in paths])
        mass = np.array([self.orbs[p]["mass"] for p in paths])
        target_z = np.array([self.orbs[p]["target_z"] for p in paths])

        forces = np.zeros_like(pos)

        # 1. Build quadtree from XY positions
        # Use mass=1.0 for each particle to match direct calculation behavior
        # (direct calc doesn't weight by mass in repulsion)
        quadtree = QuadTree(width=self.bounds[0], height=self.bounds[1], theta=self.theta)
        for i, path in enumerate(paths):
            x, y = pos[i][0], pos[i][1]
            # Use uniform mass=1.0 to match direct calculation
            quadtree.insert(x, y, mass=1.0, data={"path": path, "idx": i})

        # 2. Repulsive Forces using Barnes-Hut (XY plane only)
        for i in range(n):
            x, y = pos[i][0], pos[i][1]
            force_2d = quadtree.calculate_force(x, y, theta=self.theta, k_repel=self.k_repel)
            if force_2d is not None:
                fx, fy = force_2d
                forces[i][0] += fx
                forces[i][1] += fy

        # 3. Attractive Forces (3D Springs) - direct calculation
        for i, path in enumerate(paths):
            for linked_path in self.orbs[path]["links"]:
                if linked_path in self.orbs:
                    j = paths.index(linked_path)
                    diff = pos[j] - pos[i]
                    forces[i] += self.k_spring * diff
                    forces[j] -= self.k_spring * diff

        # 4. Z-Axis Layer Affinity (Restoring Force)
        z_diff = target_z - pos[:, 2]
        forces[:, 2] += self.k_layer * z_diff

        # 5. Ripple Forces (Full 3D)
        for ripple in self.ripples:
            diff = pos - ripple["pos"]
            dist_sq = np.sum(diff**2, axis=1) + 0.01
            dist = np.sqrt(dist_sq)

            mask = dist < ripple["radius"]
            if np.any(mask):
                magnitude = ripple["force"] / dist_sq
                ripple_forces = magnitude[:, np.newaxis] * diff
                forces[mask] += ripple_forces[mask]

        # 6. Integration
        accel = forces / mass[:, np.newaxis]
        vel = (vel + accel * self.dt) * self.friction
        pos = pos + vel * self.dt

        # Constrain to 3D bounds
        pos = np.clip(pos, [0, 0, 0], self.bounds)

        # Update internal state
        for i, path in enumerate(paths):
            self.orbs[path]["pos"] = pos[i]
            self.orbs[path]["vel"] = vel[i]

    def get_updates(self) -> list[dict[str, Any]]:
        """Return changed 3D positions for the compositor."""
        updates = []
        for path, data in self.orbs.items():
            updates.append({
                "path": path,
                "x": float(data["pos"][0]),
                "y": float(data["pos"][1]),
                "z": float(data["pos"][2]),
                "velocity": float(np.linalg.norm(data["vel"]))
            })
        return updates

    def get_ripples(self) -> list[dict[str, Any]]:
        """Return active physical ripples for visual rendering."""
        return [
            {
                "x": float(r["pos"][0]),
                "y": float(r["pos"][1]),
                "z": float(r["pos"][2]),
                "force": float(r["force"]),
                "radius": float(r["radius"])
            }
            for r in self.ripples
        ]

    def update_mass(self, file_path: str, delta: float):
        if file_path in self.orbs:
            self.orbs[file_path]["mass"] = max(0.1, self.orbs[file_path]["mass"] + delta)

    def set_mass(self, file_path: str, mass: float):
        """Set an orb's mass directly."""
        if file_path in self.orbs:
            self.orbs[file_path]["mass"] = max(0.1, mass)

    def set_target_z(self, file_path: str, target_z: float):
        """Shift an orb to a new semantic layer."""
        if file_path in self.orbs:
            self.orbs[file_path]["target_z"] = target_z

if __name__ == "__main__":
    engine = GravityEngine()
    print("Testing 3D Gravity Engine...")
    # Add files at different layers
    engine.add_orb("kernel.rs", 100, 100, 0, 5000, target_z=0)      # Layer 0: Foundation
    engine.add_orb("app.py", 110, 110, 128, 2000, target_z=128)    # Layer 128: Logic
    engine.add_orb("readme.md", 500, 500, 255, 1000, target_z=255) # Layer 255: Concept

    engine.link_orbs("kernel.rs", "app.py")

    for i in range(20):
        engine.update()
        updates = engine.get_updates()
        print(f"Step {i}: kernel.z={updates[0]['z']:.1f}, app.z={updates[1]['z']:.1f}, doc.z={updates[2]['z']:.1f}")

    print("3D Gravity Simulation Complete.")
