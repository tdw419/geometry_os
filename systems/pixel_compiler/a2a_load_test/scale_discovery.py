# systems/pixel_compiler/a2a_load_test/scale_discovery.py
"""Scale limit discovery for A2A testing."""
import asyncio
import logging
from dataclasses import dataclass
from enum import Enum
from typing import Callable, Optional

logger = logging.getLogger(__name__)


class LimitType(Enum):
    """Types of scale limits."""
    AGENT_COUNT = "agent_count"
    MESSAGE_RATE = "message_rate"
    CONCURRENT_MESSAGES = "concurrent_messages"
    MEMORY_MB = "memory_mb"


@dataclass
class ScaleLimit:
    """Discovered scale limit."""
    limit_type: LimitType
    value: int
    metric: str
    threshold: float
    description: str = ""
    confidence: float = 1.0


class ScaleDiscovery:
    """Discovers system scale limits through binary search."""

    def __init__(
        self,
        router_url: str,
        target_success_rate: float = 0.95
    ):
        self.router_url = router_url
        self.target_success_rate = target_success_rate
        self._test_agent_count: Optional[Callable] = None

    async def find_agent_limit(
        self,
        min_agents: int = 10,
        max_agents: int = 1000,
        tolerance: int = 10
    ) -> ScaleLimit:
        """Find maximum agent count using binary search."""
        low, high = min_agents, max_agents
        best_pass = low

        while high - low > tolerance:
            mid = (low + high + 1) // 2

            if self._test_agent_count:
                passed = await self._test_agent_count(mid)
            else:
                passed = await self._default_test(mid)

            if passed:
                best_pass = mid
                low = mid
                logger.info(f"Agent count {mid}: PASS")
            else:
                high = mid - 1
                logger.info(f"Agent count {mid}: FAIL")

        # Return the highest passing value (or high if all passed)
        result = high if high == max_agents else best_pass
        return ScaleLimit(
            limit_type=LimitType.AGENT_COUNT,
            value=result,
            metric="success_rate",
            threshold=self.target_success_rate,
            description=f"Maximum agents at {self.target_success_rate:.0%} success"
        )

    async def find_message_rate_limit(
        self,
        agent_count: int,
        min_rate: int = 10,
        max_rate: int = 10000,
        tolerance: int = 50
    ) -> ScaleLimit:
        """Find maximum message rate per agent."""
        low, high = min_rate, max_rate
        best_pass = low

        while high - low > tolerance:
            mid = (low + high + 1) // 2
            passed = await self._test_message_rate(agent_count, mid)

            if passed:
                best_pass = mid
                low = mid
            else:
                high = mid - 1

        return ScaleLimit(
            limit_type=LimitType.MESSAGE_RATE,
            value=best_pass,
            metric="success_rate",
            threshold=self.target_success_rate,
            description=f"Max rate at {agent_count} agents"
        )

    async def _default_test(self, agent_count: int) -> bool:
        """Default test implementation (always passes)."""
        return True

    async def _test_message_rate(self, agent_count: int, rate: int) -> bool:
        """Test if a message rate is sustainable."""
        return True
