"""
Inter-Brain Trade - Phase 46

Connects multiple PixelBrain instances for distributed cognition.
Citizens can migrate between brains, trade across instances, form distributed neural networks.

The brain network becomes the living ecosystem.
"""

import asyncio
import json
import time
from typing import Dict, List, Optional, Set
from dataclasses import dataclass, field


@dataclass
class BrainNode:
    """A PixelBrain instance in the network."""
    id: str
    host: str
    port: int
    atlas_size: tuple  # (width, height)
    citizen_count: int = 0
    total_energy: float = 0.0
    last_heartbeat: float = 0.0
    neighbors: Set[str] = field(default_factory=set)


@dataclass
class TradeRoute:
    """A trading route between two brains."""
    source_brain: str
    target_brain: str
    bandwidth: float  # Energy transfer rate
    latency_ms: float
    established_time: float
    total_traded: float = 0.0


class InterBrainNetwork:
    """
    Network of multiple PixelBrain instances.

    Citizens can migrate between brains based on:
    - energy gradients
    - resource availability
    - social connections
    """

    def __init__(self):
        self.brains: Dict[str, BrainNode] = {}
        self.routes: List[TradeRoute] = []
        self.citizens_in_transit: Dict[str, str] = {}  # citizen_id -> target_brain

        self.stats = {
            'total_brains': 0,
            'total_routes': 0,
            'total_migrations': 0,
            'total_cross_brain_trades': 0
        }

    def register_brain(self, brain_id: str, host: str, port: int, atlas_size: tuple) -> BrainNode:
        """Register a new brain in the network."""
        brain = BrainNode(
            id=brain_id,
            host=host,
            port=port,
            atlas_size=atlas_size,
            last_heartbeat=time.time()
        )
        self.brains[brain_id] = brain
        self.stats['total_brains'] = len(self.brains)

        # Discover neighbors (async, non-blocking)
        try:
            loop = asyncio.get_event_loop()
            if loop.is_running():
                asyncio.create_task(self._discover_neighbors(brain_id))
        except RuntimeError:
            pass

        return brain

    async def _discover_neighbors(self, brain_id: str):
        """Discover neighboring brains via heartbeat."""
        brain = self.brains.get(brain_id)
        if not brain:
            return

        for other_id, other_brain in self.brains.items():
            if other_id == brain_id:
                continue

            # Check connectivity (simulated)
            # In production, would ping via WebSocket
            latency = abs(hash(brain_id + other_id) % 50 + 10)  # Simulated

            if latency < 100:  # 100ms threshold
                brain.neighbors.add(other_id)
                other_brain.neighbors.add(brain_id)

    def establish_route(self, source: str, target: str, bandwidth: float = 0.5) -> Optional[TradeRoute]:
        """Establish a trading route between two brains."""
        if source not in self.brains or target not in self.brains:
            return None

        # Check if already exists
        for route in self.routes:
            if route.source_brain == source and route.target_brain == target:
                return route

        route = TradeRoute(
            source_brain=source,
            target_brain=target,
            bandwidth=bandwidth,
            latency_ms=abs(hash(source + target) % 50 + 10),
            established_time=time.time()
        )
        self.routes.append(route)
        self.stats['total_routes'] = len(self.routes)

        return route

    def migrate_citizen(self, citizen_id: str, from_brain: str, to_brain: str) -> bool:
        """
        Migrate a citizen from one brain to another.

        Returns True if migration successful.
        """
        if from_brain not in self.brains or to_brain not in self.brains:
            return False

        # Check for route
        route = None
        for r in self.routes:
            if r.source_brain == from_brain and r.target_brain == to_brain:
                route = r
                break

        if not route:
            # Establish temporary route
            route = self.establish_route(from_brain, to_brain, 0.3)
            if not route:
                return False

        # Mark citizen in transit
        self.citizens_in_transit[citizen_id] = to_brain
        self.stats['total_migrations'] += 1

        return True

    def cross_brain_trade(
        self,
        from_brain: str,
        to_brain: str,
        citizen_a_id: str,
        citizen_b_id: str,
        amount: float
    ) -> bool:
        """
        Execute a cross-brain trade between citizens on different brains.
        """
        if from_brain not in self.brains or to_brain not in self.brains:
            return False

        # Find or establish route
        route = None
        for r in self.routes:
            if r.source_brain == from_brain and r.target_brain == to_brain:
                route = r
                break

        if not route:
            route = self.establish_route(from_brain, to_brain, 0.5)
            if not route:
                return False

        # Execute trade
        route.total_traded += amount
        self.stats['total_cross_brain_trades'] += 1

        return True

    def get_network_status(self) -> Dict:
        """Get current network status."""
        return {
            'brains': {
                brain_id: {
                    'host': brain.host,
                    'citizens': brain.citizen_count,
                    'energy': brain.total_energy,
                    'neighbors': list(brain.neighbors)
                }
                for brain_id, brain in self.brains.items()
            },
            'routes': [
                {
                    'source': r.source_brain,
                    'target': r.target_brain,
                    'bandwidth': r.bandwidth,
                    'total_traded': r.total_traded
                }
                for r in self.routes
            ],
            'in_transit': dict(self.citizens_in_transit),
            'stats': self.stats
        }

    def to_dict(self) -> Dict:
        """Serialize network state."""
        return {
            'brains': {
                bid: {
                    'id': b.id,
                    'host': b.host,
                    'port': b.port,
                    'citizen_count': b.citizen_count,
                    'total_energy': b.total_energy,
                    'neighbors': list(b.neighbors)
                }
                for bid, b in self.brains.items()
            },
            'routes': [
                {
                    'source': r.source_brain,
                    'target': r.target_brain,
                    'bandwidth': r.bandwidth,
                    'latency_ms': r.latency_ms,
                    'total_traded': r.total_traded
                }
                for r in self.routes
            ],
            'stats': self.stats
        }
