"""
NeuralMemoryHub - Central service for distributed neural memory.

Part of Phase 27: Distributed Neural Memory
"""
import asyncio
import logging
import time
from typing import List, Dict, Any, Optional
from dataclasses import dataclass, field

import numpy as np

from systems.evolution_daemon.neural_event import NeuralEvent, EventType

logger = logging.getLogger("evolution_daemon.neural_memory_hub")


@dataclass
class NeuralMemoryHub:
    """
    Central service for storing and retrieving neural events.

    Provides:
    - Event storage with automatic expiry
    - Similarity search using cosine similarity
    - Collective context generation for tiles
    - Integration with ConsensusEngine for confidence

    Attributes:
        max_events: Maximum events to store (default 1000)
        max_age_seconds: Event expiry time (default 3600)
        similarity_threshold: Minimum similarity for matching (default 0.7)
    """
    max_events: int = 1000
    max_age_seconds: float = 3600.0
    similarity_threshold: float = 0.7

    events: List[NeuralEvent] = field(default_factory=list)
    _webmcp: Any = field(default=None, repr=False)

    def set_webmcp(self, webmcp):
        """Set WebMCP instance for broadcasting."""
        self._webmcp = webmcp

    async def store_event(self, event: NeuralEvent) -> None:
        """
        Store a neural event in memory.

        Args:
            event: The NeuralEvent to store
        """
        self.events.append(event)
        logger.debug(f"Stored event {event.event_id} from {event.tile_id}")

        # Enforce max events limit (FIFO)
        while len(self.events) > self.max_events:
            self.events.pop(0)

        # Broadcast if event is marked for sharing
        if event.broadcast and self._webmcp:
            await self._broadcast_event(event)

    async def find_similar(
        self,
        query: NeuralEvent,
        limit: int = 5,
        exclude_tile: Optional[str] = None
    ) -> List[NeuralEvent]:
        """
        Find events similar to the query using cosine similarity.

        Args:
            query: Query event to match against
            limit: Maximum number of results
            exclude_tile: Optional tile ID to exclude from results

        Returns:
            List of similar events, ordered by similarity (highest first)
        """
        if query.event_vector is None:
            return []

        similarities = []
        for event in self.events:
            # Skip excluded tile
            if exclude_tile and event.tile_id == exclude_tile:
                continue
            # Skip non-broadcast events
            if not event.broadcast:
                continue
            # Skip events without vectors
            if event.event_vector is None:
                continue

            # Calculate cosine similarity
            sim = self._cosine_similarity(query.event_vector, event.event_vector)
            if sim >= self.similarity_threshold:
                similarities.append((sim, event))

        # Sort by similarity (descending)
        similarities.sort(key=lambda x: x[0], reverse=True)

        return [event for _, event in similarities[:limit]]

    async def get_collective_context(
        self,
        tile_id: str,
        context_limit: int = 3
    ) -> Dict[str, Any]:
        """
        Get collective context for a tile.

        Returns relevant memories from other tiles that might help
        the requesting tile understand the collective state.

        Args:
            tile_id: The requesting tile's ID
            context_limit: Maximum number of context events

        Returns:
            Dict with recent_events, similar_tiles, and metadata
        """
        # Get recent broadcast events from other tiles
        recent = [
            e for e in self.events[-10:]
            if e.broadcast and e.tile_id != tile_id
        ][-context_limit:]

        # Get tile's own recent event for similarity matching
        own_events = [e for e in self.events if e.tile_id == tile_id]
        query = own_events[-1] if own_events else None

        # Find similar events
        similar = []
        if query:
            similar = await self.find_similar(query, limit=context_limit, exclude_tile=tile_id)

        return {
            "recent_events": [e.to_dict() for e in recent],
            "similar_tiles": list(set(e.tile_id for e in similar)),
            "similar_events": [e.to_dict() for e in similar],
            "total_memory_size": len(self.events),
            "timestamp": time.time()
        }

    async def get_broadcast_events(self) -> List[NeuralEvent]:
        """Get all events marked for broadcast."""
        return [e for e in self.events if e.broadcast]

    async def cleanup_expired(self) -> int:
        """
        Remove events older than max_age_seconds.

        Returns:
            Number of events removed
        """
        now = time.time()
        original_len = len(self.events)
        self.events = [
            e for e in self.events
            if (now - e.timestamp) < self.max_age_seconds
        ]
        removed = original_len - len(self.events)
        if removed > 0:
            logger.debug(f"Cleaned up {removed} expired events")
        return removed

    def _cosine_similarity(self, a: np.ndarray, b: np.ndarray) -> float:
        """Calculate cosine similarity between two vectors."""
        norm_a = np.linalg.norm(a)
        norm_b = np.linalg.norm(b)
        if norm_a == 0 or norm_b == 0:
            return 0.0
        return float(np.dot(a, b) / (norm_a * norm_b))

    async def _broadcast_event(self, event: NeuralEvent) -> None:
        """Broadcast event via WebMCP."""
        if self._webmcp:
            try:
                await self._webmcp.broadcast_event("neural_event", event.to_dict())
            except Exception as e:
                logger.warning(f"Failed to broadcast event: {e}")


# Singleton instance
_hub: Optional[NeuralMemoryHub] = None


def get_neural_memory_hub() -> NeuralMemoryHub:
    """Get the global NeuralMemoryHub instance."""
    global _hub
    if _hub is None:
        _hub = NeuralMemoryHub()
    return _hub
