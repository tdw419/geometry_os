"""
Topology configuration for A2A agent meshes.

Defines communication patterns between agents:
- Star: Hub-spoke (coordinator pattern)
- Mesh: Full peer-to-peer
- Ring: Circular pipeline
- Line: Sequential pipeline
- Hierarchical: Tree structure
"""

from dataclasses import dataclass, field
from typing import Dict, List, Set, Tuple, Optional, Any


@dataclass
class Topology:
    """Represents a network topology."""

    name: str
    agent_count: int
    edges: Set[Tuple[int, int]] = field(default_factory=set)

    def get_edges(self) -> Set[Tuple[int, int]]:
        """Return all edges as a set of (from, to) tuples."""
        return self.edges.copy()

    def get_neighbors(self, node: int) -> List[int]:
        """Get all neighbors of a node."""
        neighbors = []
        for src, dst in self.edges:
            if src == node:
                neighbors.append(dst)
            elif dst == node:
                neighbors.append(src)
        return list(set(neighbors))

    def assign_agents(self, agents: List[Any]) -> None:
        """Assign neighbor references to agents."""
        for i, agent in enumerate(agents):
            agent._neighbors = self.get_neighbors(i)


class TopologyBuilder:
    """Builder for creating different topologies."""

    @staticmethod
    def star(agent_count: int, hub_index: int = 0) -> Topology:
        """
        Create star topology (hub-spoke).

        Hub node connects to all others, leaf nodes only connect to hub.
        """
        edges = set()
        for i in range(agent_count):
            if i != hub_index:
                edges.add((hub_index, i))

        return Topology(
            name="star",
            agent_count=agent_count,
            edges=edges
        )

    @staticmethod
    def full_mesh(agent_count: int) -> Topology:
        """
        Create full mesh topology.

        Every node connects to every other node.
        """
        edges = set()
        for i in range(agent_count):
            for j in range(i + 1, agent_count):
                edges.add((i, j))

        return Topology(
            name="full_mesh",
            agent_count=agent_count,
            edges=edges
        )

    @staticmethod
    def ring(agent_count: int) -> Topology:
        """
        Create ring topology.

        Node i connects to node (i+1) mod n.
        """
        edges = set()
        for i in range(agent_count):
            edges.add((i, (i + 1) % agent_count))

        return Topology(
            name="ring",
            agent_count=agent_count,
            edges=edges
        )

    @staticmethod
    def line(agent_count: int) -> Topology:
        """
        Create line topology.

        Node i connects to node i+1 (no wrap-around).
        """
        edges = set()
        for i in range(agent_count - 1):
            edges.add((i, i + 1))

        return Topology(
            name="line",
            agent_count=agent_count,
            edges=edges
        )

    @staticmethod
    def hierarchical(levels: int, fanout: int = 2) -> Topology:
        """
        Create hierarchical tree topology.

        Root has fanout children, each child has fanout children, etc.
        """
        edges = set()

        # Calculate total nodes: sum of fanout^i for i=0..levels-1
        total_nodes = sum(fanout ** i for i in range(levels))

        # Build tree edges
        for level in range(levels - 1):
            level_start = sum(fanout ** i for i in range(level))
            level_count = fanout ** level
            next_level_start = level_start + level_count

            for parent in range(level_start, level_start + level_count):
                for child_offset in range(fanout):
                    child = next_level_start + (parent - level_start) * fanout + child_offset
                    if child < total_nodes:
                        edges.add((parent, child))

        return Topology(
            name="hierarchical",
            agent_count=total_nodes,
            edges=edges
        )
