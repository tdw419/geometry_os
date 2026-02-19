#!/usr/bin/env python3
"""
MutationEmitter - Connects EvolutionDaemon to A2A Router

This module bridges the Evolution Daemon with the Agent-to-Agent (A2A)
message routing system for broadcasting weight mutations and district
upgrades to other agents in the system.

Features:
- Queue mutations and upgrades for batch transmission
- Auto-flush at batch size threshold (default 100)
- Manual flush capability
- Async WebSocket connection management
- Connection retry with exponential backoff
- Integration with WeightMutation protocol from neural_city
"""

import asyncio
import json
import logging
import time
import uuid
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional, Set
from collections import deque

import websockets

# Import mutation protocol from neural_city
from systems.neural_city.mutation_protocol import WeightMutation, DistrictUpgrade, MutationAuthority

logger = logging.getLogger(__name__)


@dataclass
class EmitterStats:
    """Statistics for the MutationEmitter"""
    mutations_queued: int = 0
    upgrades_queued: int = 0
    mutations_sent: int = 0
    upgrades_sent: int = 0
    batches_sent: int = 0
    connection_errors: int = 0
    last_flush_time: Optional[float] = None
    last_flush_count: int = 0


@dataclass
class PendingBatch:
    """A batch of mutations waiting to be sent"""
    mutations: List[Dict[str, Any]] = field(default_factory=list)
    upgrades: List[Dict[str, Any]] = field(default_factory=list)
    created_at: float = field(default_factory=time.time)

    def total_count(self) -> int:
        """Total items in batch"""
        return len(self.mutations) + len(self.upgrades)

    def to_json(self) -> Dict[str, Any]:
        """Convert batch to JSON for transmission"""
        return {
            "batch_id": str(uuid.uuid4()),
            "timestamp": time.time(),
            "mutations": self.mutations,
            "upgrades": self.upgrades,
            "count": self.total_count()
        }


class MutationEmitter:
    """
    Emitter for broadcasting weight mutations via A2A Router.

    The MutationEmitter queues mutation events and sends them in batches
    to the A2A Router for distribution to subscribed agents.

    Usage:
        emitter = MutationEmitter(a2a_url="ws://localhost:8766")
        await emitter.connect()

        # Queue mutations
        mutation = WeightMutation(index_1d=1234, weight_delta=0.01)
        await emitter.queue_mutation(mutation)

        # Auto-flush at 100 items or manual flush
        await emitter.flush()
    """

    def __init__(
        self,
        a2a_url: str = "ws://localhost:8766",
        batch_size: int = 100,
        agent_id: str = "evolution_daemon",
        agent_type: str = "evolution",
        retry_max_attempts: int = 5,
        retry_base_delay: float = 1.0
    ):
        """
        Initialize the MutationEmitter.

        Args:
            a2a_url: WebSocket URL of the A2A Router
            batch_size: Number of items to queue before auto-flush
            agent_id: Unique identifier for this agent
            agent_type: Type of agent (for A2A registration)
            retry_max_attempts: Maximum connection retry attempts
            retry_base_delay: Base delay for exponential backoff (seconds)
        """
        self.a2a_url = a2a_url
        self.batch_size = batch_size
        self.agent_id = agent_id
        self.agent_type = agent_type
        self.retry_max_attempts = retry_max_attempts
        self.retry_base_delay = retry_base_delay

        # WebSocket connection
        self.ws: Optional[websockets.WebSocketClientProtocol] = None
        self.connected = False
        self.registered = False

        # Pending batch
        self._pending = PendingBatch()

        # Statistics
        self.stats = EmitterStats()

        # Lock for thread-safe operations
        self._lock = asyncio.Lock()

        # Callbacks for events
        self._on_flush_callbacks: List[callable] = []

    def on_flush(self, callback: callable):
        """Register a callback to be called after each flush"""
        self._on_flush_callbacks.append(callback)

    async def connect(self) -> bool:
        """
        Connect to the A2A Router with retry logic.

        Returns:
            True if connection successful, False otherwise
        """
        for attempt in range(self.retry_max_attempts):
            try:
                logger.info(f"Connecting to A2A Router at {self.a2a_url} (attempt {attempt + 1}/{self.retry_max_attempts})")

                self.ws = await websockets.connect(
                    self.a2a_url,
                    subprotocols=["a2a"],
                    close_timeout=10
                )
                self.connected = True

                # Register with the router
                await self._register()

                logger.info(f"✅ MutationEmitter connected and registered as {self.agent_id}")
                return True

            except (OSError, websockets.exceptions.InvalidURI, websockets.exceptions.InvalidHandshake) as e:
                delay = self.retry_base_delay * (2 ** attempt)
                logger.warning(f"Connection failed: {e}. Retrying in {delay:.1f}s...")
                await asyncio.sleep(delay)
                self.stats.connection_errors += 1

            except Exception as e:
                logger.error(f"Unexpected error connecting to A2A Router: {e}")
                self.stats.connection_errors += 1
                await asyncio.sleep(self.retry_base_delay)

        logger.error(f"Failed to connect after {self.retry_max_attempts} attempts")
        return False

    async def _register(self):
        """Register this agent with the A2A Router"""
        if not self.ws or not self.connected:
            raise RuntimeError("Cannot register: not connected")

        register_msg = {
            "type": "register",
            "agent_id": self.agent_id,
            "agent_type": self.agent_type,
            "capabilities": ["emit_mutations", "emit_upgrades"],
            "topics": ["mutation_events", "district_events"]
        }

        await self.ws.send(json.dumps(register_msg))

        # Wait for acknowledgment
        try:
            response = await asyncio.wait_for(self.ws.recv(), timeout=5.0)
            data = json.loads(response)

            if data.get("type") == "ack" and data.get("status") == "registered":
                self.registered = True
                logger.info(f"Registered with A2A Router: {self.agent_id}")
            else:
                logger.warning(f"Unexpected registration response: {data}")

        except asyncio.TimeoutError:
            logger.warning("Registration acknowledgment timeout")

    async def disconnect(self):
        """Disconnect from the A2A Router"""
        if self.ws:
            try:
                # Flush any pending items
                await self.flush()

                # Unregister
                if self.registered:
                    await self.ws.send(json.dumps({
                        "type": "unregister",
                        "agent_id": self.agent_id
                    }))

                await self.ws.close()
            except Exception as e:
                logger.warning(f"Error during disconnect: {e}")
            finally:
                self.ws = None
                self.connected = False
                self.registered = False

    async def queue_mutation(self, mutation: WeightMutation) -> None:
        """
        Queue a weight mutation for batch transmission.

        Args:
            mutation: WeightMutation to queue
        """
        async with self._lock:
            self._pending.mutations.append(mutation.to_json())
            self.stats.mutations_queued += 1

            logger.debug(f"Queued mutation {mutation.mutation_id} at index {mutation.index_1d}")

            # Auto-flush if batch size reached
            if self._pending.total_count() >= self.batch_size:
                await self._do_flush()

    async def queue_upgrade(self, upgrade: DistrictUpgrade) -> None:
        """
        Queue a district upgrade for batch transmission.

        Args:
            upgrade: DistrictUpgrade to queue
        """
        async with self._lock:
            self._pending.upgrades.append(upgrade.to_json())
            self.stats.upgrades_queued += 1

            logger.debug(f"Queued upgrade {upgrade.upgrade_id} for district {upgrade.district_id}")

            # Auto-flush if batch size reached
            if self._pending.total_count() >= self.batch_size:
                await self._do_flush()

    async def flush(self) -> bool:
        """
        Manually flush the pending batch to the A2A Router.

        Returns:
            True if flush successful, False otherwise
        """
        async with self._lock:
            return await self._do_flush()

    async def _do_flush(self) -> bool:
        """
        Internal flush implementation (assumes lock held).

        Returns:
            True if flush successful, False otherwise
        """
        if self._pending.total_count() == 0:
            return True  # Nothing to flush

        if not self.connected or not self.ws:
            logger.warning("Cannot flush: not connected to A2A Router")
            return False

        batch_data = self._pending.to_json()

        try:
            # Send batch as a broadcast message
            broadcast_msg = {
                "type": "broadcast",
                "from_agent": self.agent_id,
                "message_type": "mutation_batch",
                "payload": batch_data
            }

            await self.ws.send(json.dumps(broadcast_msg))

            # Update statistics
            mutation_count = len(self._pending.mutations)
            upgrade_count = len(self._pending.upgrades)

            self.stats.mutations_sent += mutation_count
            self.stats.upgrades_sent += upgrade_count
            self.stats.batches_sent += 1
            self.stats.last_flush_time = time.time()
            self.stats.last_flush_count = self._pending.total_count()

            logger.info(
                f"Flushed batch: {mutation_count} mutations, {upgrade_count} upgrades "
                f"(batch_id: {batch_data['batch_id'][:8]})"
            )

            # Clear pending batch
            self._pending = PendingBatch()

            # Trigger callbacks
            for callback in self._on_flush_callbacks:
                try:
                    if asyncio.iscoroutinefunction(callback):
                        await callback(batch_data)
                    else:
                        callback(batch_data)
                except Exception as e:
                    logger.warning(f"Flush callback error: {e}")

            return True

        except websockets.exceptions.ConnectionClosed:
            logger.error("Connection closed during flush")
            self.connected = False
            self.stats.connection_errors += 1
            return False

        except Exception as e:
            logger.error(f"Error flushing batch: {e}")
            self.stats.connection_errors += 1
            return False

    async def get_pending_count(self) -> int:
        """Get the number of pending items in the current batch"""
        async with self._lock:
            return self._pending.total_count()

    async def get_stats(self) -> EmitterStats:
        """Get current emitter statistics"""
        async with self._lock:
            # Return a copy to avoid external modification
            return EmitterStats(
                mutations_queued=self.stats.mutations_queued,
                upgrades_queued=self.stats.upgrades_queued,
                mutations_sent=self.stats.mutations_sent,
                upgrades_sent=self.stats.upgrades_sent,
                batches_sent=self.stats.batches_sent,
                connection_errors=self.stats.connection_errors,
                last_flush_time=self.stats.last_flush_time,
                last_flush_count=self.stats.last_flush_count
            )

    def is_connected(self) -> bool:
        """Check if the emitter is connected and registered"""
        return self.connected and self.registered


# Convenience functions for common use cases

async def emit_mutation_batch(
    mutations: List[WeightMutation],
    a2a_url: str = "ws://localhost:8766",
    agent_id: str = "evolution_daemon"
) -> bool:
    """
    Emit a batch of mutations in one call.

    Convenience function for one-off batch emission.

    Args:
        mutations: List of WeightMutation objects to emit
        a2a_url: A2A Router WebSocket URL
        agent_id: Agent identifier

    Returns:
        True if all mutations were sent successfully
    """
    emitter = MutationEmitter(a2a_url=a2a_url, agent_id=agent_id, batch_size=len(mutations) + 1)

    try:
        if not await emitter.connect():
            return False

        for mutation in mutations:
            await emitter.queue_mutation(mutation)

        return await emitter.flush()

    finally:
        await emitter.disconnect()


async def emit_upgrade_batch(
    upgrades: List[DistrictUpgrade],
    a2a_url: str = "ws://localhost:8766",
    agent_id: str = "evolution_daemon"
) -> bool:
    """
    Emit a batch of district upgrades in one call.

    Convenience function for one-off batch emission.

    Args:
        upgrades: List of DistrictUpgrade objects to emit
        a2a_url: A2A Router WebSocket URL
        agent_id: Agent identifier

    Returns:
        True if all upgrades were sent successfully
    """
    emitter = MutationEmitter(a2a_url=a2a_url, agent_id=agent_id, batch_size=len(upgrades) + 1)

    try:
        if not await emitter.connect():
            return False

        for upgrade in upgrades:
            await emitter.queue_upgrade(upgrade)

        return await emitter.flush()

    finally:
        await emitter.disconnect()


if __name__ == "__main__":
    # Example usage
    async def main():
        logging.basicConfig(level=logging.INFO)

        emitter = MutationEmitter()

        if await emitter.connect():
            # Queue some mutations
            for i in range(10):
                mutation = WeightMutation(
                    index_1d=i,
                    weight_delta=0.01 * (i % 3 - 1),
                    layer=f"layer_{i % 3}",
                    authority=MutationAuthority.ENGINEER
                )
                await emitter.queue_mutation(mutation)

            # Flush manually
            await emitter.flush()

            # Get stats
            stats = await emitter.get_stats()
            print(f"Stats: {stats}")

        await emitter.disconnect()

    asyncio.run(main())
