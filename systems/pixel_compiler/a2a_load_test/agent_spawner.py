"""
Virtual Agent Spawner for A2A Scale Testing.

Creates multiple simulated agents that connect to the A2A router
for load testing and benchmarking.
"""

import asyncio
import json
import time
import uuid
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any
import websockets


@dataclass
class VirtualAgent:
    """A virtual agent that connects to the A2A router."""

    agent_id: str
    agent_type: str
    capabilities: List[str] = field(default_factory=list)
    region: Optional[Dict[str, int]] = None

    # Connection state
    _websocket: Optional[Any] = field(default=None, repr=False)
    is_connected: bool = False

    # Statistics
    messages_sent: int = 0
    messages_received: int = 0
    total_latency_ms: float = 0.0

    # Neighbors for topology (set by Topology.assign_agents)
    _neighbors: List[int] = field(default_factory=list, repr=False)

    def create_message(
        self,
        to_agent: str,
        message_type: str,
        content: Dict[str, Any],
        correlation_id: Optional[str] = None
    ) -> Dict[str, Any]:
        """Create an A2A protocol message."""
        return {
            "type": "direct",
            "from_agent": self.agent_id,
            "to_agent": to_agent,
            "message_type": message_type,
            "content": content,
            "correlation_id": correlation_id or str(uuid.uuid4()),
            "timestamp": time.time()
        }

    def create_broadcast(
        self,
        message_type: str,
        content: Dict[str, Any],
        agent_type: Optional[str] = None
    ) -> Dict[str, Any]:
        """Create a broadcast message."""
        return {
            "type": "broadcast",
            "from_agent": self.agent_id,
            "agent_type": agent_type,
            "message_type": message_type,
            "content": content,
            "timestamp": time.time()
        }

    async def connect(self, router_url: str) -> None:
        """Connect to the A2A router."""
        self._websocket = await websockets.connect(router_url, subprotocols=["a2a"])

        # Register with the router
        register_msg = {
            "type": "register",
            "agent_id": self.agent_id,
            "agent_type": self.agent_type,
            "capabilities": self.capabilities,
            "region": self.region
        }

        await self._websocket.send(json.dumps(register_msg))
        response = await self._websocket.recv()
        data = json.loads(response)

        if data.get("type") == "ack":
            self.is_connected = True

    async def disconnect(self) -> None:
        """Disconnect from the router."""
        if self._websocket:
            await self._websocket.close()
            self._websocket = None
            self.is_connected = False

    async def send_message(self, message: Dict[str, Any]) -> Dict[str, Any]:
        """Send a message and return the response."""
        if not self._websocket:
            raise RuntimeError("Agent not connected")

        start_time = time.time()
        await self._websocket.send(json.dumps(message))
        self.messages_sent += 1

        response = await self._websocket.recv()
        latency = (time.time() - start_time) * 1000
        self.total_latency_ms += latency
        self.messages_received += 1

        return json.loads(response)

    @property
    def avg_latency_ms(self) -> float:
        """Average message latency in milliseconds."""
        if self.messages_received == 0:
            return 0.0
        return self.total_latency_ms / self.messages_received


class AgentSpawner:
    """
    Spawns and manages multiple virtual agents for load testing.
    """

    def __init__(
        self,
        router_url: str = "ws://localhost:8766",
        agent_count: Optional[int] = None,
        agent_types: Optional[List[str]] = None,
        agents_per_type: int = 1
    ):
        self.router_url = router_url
        self.agent_count = agent_count
        self.agent_types = agent_types or ["generic"]
        self.agents_per_type = agents_per_type
        self.agents: List[VirtualAgent] = []

    async def spawn(self) -> List[VirtualAgent]:
        """Spawn all configured agents."""
        if self.agent_count is not None:
            # Spawn N agents of first type
            for i in range(self.agent_count):
                agent = VirtualAgent(
                    agent_id=f"virtual-agent-{i:04d}",
                    agent_type=self.agent_types[0],
                    capabilities=["load_test"]
                )
                await agent.connect(self.router_url)
                self.agents.append(agent)
        else:
            # Spawn agents_per_type for each type
            for agent_type in self.agent_types:
                for i in range(self.agents_per_type):
                    agent = VirtualAgent(
                        agent_id=f"virtual-{agent_type}-{i:04d}",
                        agent_type=agent_type,
                        capabilities=["load_test"]
                    )
                    await agent.connect(self.router_url)
                    self.agents.append(agent)

        return self.agents

    async def shutdown(self) -> None:
        """Disconnect all agents."""
        for agent in self.agents:
            await agent.disconnect()
        self.agents.clear()

    def get_stats(self) -> Dict[str, Any]:
        """Get aggregate statistics for all agents."""
        if not self.agents:
            return {"agents": 0}

        total_sent = sum(a.messages_sent for a in self.agents)
        total_received = sum(a.messages_received for a in self.agents)
        avg_latencies = [a.avg_latency_ms for a in self.agents if a.messages_received > 0]

        return {
            "agents": len(self.agents),
            "messages_sent": total_sent,
            "messages_received": total_received,
            "avg_latency_ms": sum(avg_latencies) / len(avg_latencies) if avg_latencies else 0,
            "connected": sum(1 for a in self.agents if a.is_connected)
        }
