"""
Load Testing Harness for A2A Scale Testing.

Orchestrates load tests with configurable scenarios,
measures throughput and latency, generates reports.
"""

import asyncio
import json
import time
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any

from .agent_spawner import AgentSpawner, VirtualAgent
from .topology import TopologyBuilder, Topology


@dataclass
class LoadTestScenario:
    """Configuration for a load test scenario."""

    name: str
    message_count: int = 100
    message_interval_ms: int = 100
    warmup_messages: int = 10
    use_barriers: bool = False
    use_locks: bool = False
    topology: str = "star"  # star, mesh, ring, line

    # Coordination settings
    barrier_rounds: int = 0
    lock_rounds: int = 0


@dataclass
class LoadTestResult:
    """Results from a load test run."""

    scenario: str
    agent_count: int
    messages_sent: int
    messages_received: int
    duration_sec: float
    throughput_msg_per_sec: float
    avg_latency_ms: float
    p50_latency_ms: float
    p95_latency_ms: float
    p99_latency_ms: float
    errors: List[str] = field(default_factory=list)
    raw_latencies: List[float] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON export."""
        return {
            "scenario": self.scenario,
            "agent_count": self.agent_count,
            "messages_sent": self.messages_sent,
            "messages_received": self.messages_received,
            "duration_sec": self.duration_sec,
            "throughput_msg_per_sec": self.throughput_msg_per_sec,
            "avg_latency_ms": self.avg_latency_ms,
            "p50_latency_ms": self.p50_latency_ms,
            "p95_latency_ms": self.p95_latency_ms,
            "p99_latency_ms": self.p99_latency_ms,
            "errors": self.errors
        }


class LoadTestHarness:
    """
    Orchestrates load testing of the A2A router.
    """

    def __init__(
        self,
        router_url: str = "ws://localhost:8766",
        agent_count: int = 10,
        agent_types: Optional[List[str]] = None
    ):
        self.router_url = router_url
        self.agent_count = agent_count
        self.agent_types = agent_types or ["load_test"]

        self.spawner = AgentSpawner(
            router_url=router_url,
            agent_types=agent_types,
            agents_per_type=agent_count // len(self.agent_types) if agent_types else agent_count
        )
        self.topology: Optional[Topology] = None

    async def setup(self) -> None:
        """Set up agents and topology."""
        await self.spawner.spawn()

    async def teardown(self) -> None:
        """Clean up agents."""
        await self.spawner.shutdown()

    def _create_topology(self, topology_name: str) -> Topology:
        """Create topology by name."""
        builders = {
            "star": TopologyBuilder.star,
            "mesh": TopologyBuilder.full_mesh,
            "ring": TopologyBuilder.ring,
            "line": TopologyBuilder.line
        }

        builder = builders.get(topology_name, TopologyBuilder.star)
        return builder(agent_count=len(self.spawner.agents))

    async def run_scenario(self, scenario: LoadTestScenario) -> Dict[str, Any]:
        """
        Run a load test scenario.

        Returns aggregated results.
        """
        # Create topology
        self.topology = self._create_topology(scenario.topology)
        self.topology.assign_agents(self.spawner.agents)

        # Warmup phase
        await self._run_warmup(scenario.warmup_messages)

        # Main test phase
        start_time = time.time()
        latencies: List[float] = []
        messages_sent = 0
        errors: List[str] = []

        agents = self.spawner.agents
        message_interval = scenario.message_interval_ms / 1000.0

        # Distribute messages across agents
        messages_per_agent = scenario.message_count // len(agents) if agents else 0

        async def send_messages(agent: VirtualAgent, count: int) -> List[float]:
            nonlocal messages_sent
            local_latencies: List[float] = []

            for _ in range(count):
                try:
                    # Find a neighbor to send to
                    if agent._neighbors:
                        neighbor_idx = agent._neighbors[0]
                        if neighbor_idx < len(agents):
                            target = agents[neighbor_idx]
                            msg = agent.create_message(
                                to_agent=target.agent_id,
                                message_type="ping",
                                content={"timestamp": time.time()}
                            )
                            start = time.time()
                            await agent.send_message(msg)
                            latency = (time.time() - start) * 1000
                            local_latencies.append(latency)
                            messages_sent += 1
                    await asyncio.sleep(message_interval)
                except Exception as e:
                    errors.append(f"{agent.agent_id}: {str(e)}")

            return local_latencies

        # Run concurrent message sending
        tasks = [
            send_messages(agent, messages_per_agent)
            for agent in agents
        ]

        results = await asyncio.gather(*tasks)
        for result in results:
            latencies.extend(result)

        end_time = time.time()
        duration = end_time - start_time

        # Calculate metrics
        throughput = messages_sent / duration if duration > 0 else 0
        avg_latency = sum(latencies) / len(latencies) if latencies else 0

        sorted_latencies = sorted(latencies)
        p50 = self._percentile(sorted_latencies, 50)
        p95 = self._percentile(sorted_latencies, 95)
        p99 = self._percentile(sorted_latencies, 99)

        result = LoadTestResult(
            scenario=scenario.name,
            agent_count=len(agents),
            messages_sent=messages_sent,
            messages_received=sum(a.messages_received for a in agents),
            duration_sec=duration,
            throughput_msg_per_sec=throughput,
            avg_latency_ms=avg_latency,
            p50_latency_ms=p50,
            p95_latency_ms=p95,
            p99_latency_ms=p99,
            errors=errors,
            raw_latencies=latencies
        )

        return result.to_dict()

    async def _run_warmup(self, warmup_count: int) -> None:
        """Run warmup messages to establish connections."""
        agents = self.spawner.agents
        if len(agents) < 2:
            return

        for i in range(min(warmup_count, 10)):
            sender = agents[i % len(agents)]
            receiver = agents[(i + 1) % len(agents)]

            try:
                msg = sender.create_message(
                    to_agent=receiver.agent_id,
                    message_type="warmup",
                    content={"seq": i}
                )
                await sender.send_message(msg)
            except Exception:
                pass

    @staticmethod
    def _percentile(sorted_data: List[float], p: float) -> float:
        """Calculate percentile of sorted data."""
        if not sorted_data:
            return 0.0

        k = (len(sorted_data) - 1) * p / 100
        f = int(k)
        c = f + 1

        if c >= len(sorted_data):
            return sorted_data[-1]

        return sorted_data[f] + (k - f) * (sorted_data[c] - sorted_data[f])
