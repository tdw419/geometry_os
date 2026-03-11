"""
PixelBrainBridge - Connects tectonic agents to live LLM inference.

This module provides the main bridge between tectonic agents and LM Studio,
enabling intelligent decision-making for tile claims, counter-bids, and
district management.

REFACTORED: Added comprehensive error handling with:
- Circuit breaker for LM Studio API calls
- Retry logic for transient failures
- Graceful fallbacks when service unavailable
- Detailed error context and logging
- Operation tracking for debugging

Usage:
    bridge = PixelBrainBridge()

    # Analyze a tile claim
    result = await bridge.analyze_claim(
        tile=(10, 20),
        purpose="Build critical infrastructure",
        budget=100.0
    )

    # Decide on counter-bid
    should_counter = await bridge.should_counter_bid(
        original_bid=25.0,
        my_budget=80.0,
        tile=(10, 20)
    )

    # Generate district name
    name = await bridge.name_district(
        purposes=["infrastructure", "power", "networking"],
        cohesion=0.85
    )
"""

import json
import logging
import math
import re
from dataclasses import dataclass
from typing import Any

from systems.pixel_brain.async_inference import AsyncInferenceClient
from systems.pixel_brain.prompts import (
    CLAIM_ANALYSIS_PROMPT,
    COUNTER_BID_PROMPT,
    DISTRICT_NAMING_PROMPT,
    DISTRICT_PURPOSE_PROMPT,
    TECTONIC_AGENT_SYSTEM_PROMPT,
    format_agents_info,
    format_purpose_list,
)

# ERROR HANDLING IMPORTS
from core.error_integration import (
    AsyncNeuralOperation,
    get_lm_studio_circuit_breaker,
    with_retry,
)
from core.exceptions import (
    NeuralInferenceError,
    InferenceTimeoutError,
    ModelNotFoundError,
    ExternalServiceError,
    ParseError,
)

logger = logging.getLogger("pixel_brain.inference_bridge")


@dataclass
class ClaimAnalysisResult:
    """Result of claim analysis from LLM."""

    recommended_bid: float
    confidence: float
    reasoning: str

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "ClaimAnalysisResult":
        """Create from parsed JSON response."""
        return cls(
            recommended_bid=float(data.get("recommended_bid", 0.0)),
            confidence=float(data.get("confidence", 0.5)),
            reasoning=data.get("reasoning", ""),
        )


@dataclass
class CounterBidDecision:
    """Result of counter-bid decision from LLM."""

    should_counter: bool
    suggested_counter_bid: float | None
    confidence: float
    reasoning: str

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "CounterBidDecision":
        """Create from parsed JSON response."""
        return cls(
            should_counter=bool(data.get("should_counter", False)),
            suggested_counter_bid=(
                float(data["suggested_counter_bid"])
                if data.get("suggested_counter_bid") is not None
                else None
            ),
            confidence=float(data.get("confidence", 0.5)),
            reasoning=data.get("reasoning", ""),
        )


@dataclass
class DistrictPurposeResult:
    """Result of district purpose inference from LLM."""

    inferred_purpose: str
    purpose_description: str
    cohesion_score: float
    key_activities: list[str]

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "DistrictPurposeResult":
        """Create from parsed JSON response."""
        return cls(
            inferred_purpose=data.get("inferred_purpose", "unknown"),
            purpose_description=data.get("purpose_description", ""),
            cohesion_score=float(data.get("cohesion_score", 0.5)),
            key_activities=data.get("key_activities", []),
        )


@dataclass
class DistrictNameResult:
    """Result of district naming from LLM."""

    primary_name: str
    alternative_names: list[str]
    reasoning: str

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "DistrictNameResult":
        """Create from parsed JSON response."""
        return cls(
            primary_name=data.get("primary_name", "Unnamed District"),
            alternative_names=data.get("alternative_names", []),
            reasoning=data.get("reasoning", ""),
        )


def extract_json_from_response(content: str) -> dict[str, Any] | None:
    """
    Extract JSON from LLM response that may contain markdown code blocks.

    Args:
        content: Raw LLM response content

    Returns:
        Parsed JSON dict or None

    Raises:
        ParseError: If JSON extraction fails critically
    """
    # Try to find JSON in markdown code blocks
    json_pattern = r"```(?:json)?\s*([\s\S]*?)```"
    matches = re.findall(json_pattern, content)

    for match in matches:
        try:
            return json.loads(match.strip())
        except json.JSONDecodeError as e:
            logger.debug(f"Failed to parse JSON from code block: {e}")
            continue

    # Try parsing the entire content as JSON
    try:
        return json.loads(content.strip())
    except json.JSONDecodeError:
        pass

    # Try to find JSON object in the content
    brace_pattern = r"\{[\s\S]*\}"
    brace_matches = re.findall(brace_pattern, content)
    for match in brace_matches:
        try:
            return json.loads(match)
        except json.JSONDecodeError as e:
            logger.debug(f"Failed to parse JSON from braces: {e}")
            continue

    return None


class PixelBrainBridge:
    """
    Connects tectonic agents to live LLM inference.

    This bridge provides high-level methods for tectonic decisions,
    handling the complexity of prompt construction, LLM communication,
    and response parsing.

    REFACTORED: Now includes comprehensive error handling:
    - Circuit breaker prevents cascading failures
    - Automatic retry for transient errors
    - Graceful fallbacks maintain functionality
    - All errors logged with context

    Attributes:
        lm_studio_url: URL of the LM Studio API
        model: Model name to use
        client: AsyncInferenceClient for API calls
        circuit_breaker: Circuit breaker for LM Studio API
    """

    def __init__(
        self,
        lm_studio_url: str = "http://localhost:1234/v1",
        model: str = "qwen/qwen3.5-9b",
        max_requests_per_second: float = 10.0,
        cache_size: int = 256,
        cache_ttl: float = 300.0,
    ):
        """
        Initialize the PixelBrainBridge.

        Args:
            lm_studio_url: URL for LM Studio API
            model: Model name to use
            max_requests_per_second: Rate limit for API calls
            cache_size: Maximum number of cached responses
            cache_ttl: Cache time-to-live in seconds
        """
        self.lm_studio_url = lm_studio_url
        self.model = model

        self.client = AsyncInferenceClient(
            base_url=lm_studio_url,
            model=model,
            max_requests_per_second=max_requests_per_second,
            cache_size=cache_size,
            cache_ttl=cache_ttl,
        )

        # ERROR HANDLING: Circuit breaker for LM Studio
        self.circuit_breaker = get_lm_studio_circuit_breaker()

        # Metrics
        self._analysis_count = 0
        self._counter_bid_count = 0
        self._district_purpose_count = 0
        self._district_naming_count = 0
        self._fallback_count = 0  # Track fallback usage

    async def analyze_claim(
        self,
        tile: tuple[int, int],
        purpose: str,
        budget: float,
        reserved: float = 0.0,
        consumed: float = 0.0,
    ) -> ClaimAnalysisResult:
        """
        Ask LLM for optimal bid on a tile claim.

        ERROR HANDLING: Uses circuit breaker and provides fallback when
        LM Studio is unavailable. All errors logged with context.

        Args:
            tile: The (x, y) coordinates of the tile
            purpose: Description of intended use
            budget: Available budget
            reserved: Already reserved budget
            consumed: Already consumed budget

        Returns:
            ClaimAnalysisResult with recommended bid and reasoning
        """
        self._analysis_count += 1

        # ERROR HANDLING: Use async operation context
        async with AsyncNeuralOperation(
            "analyze_claim",
            tile=str(tile),
            purpose=purpose[:50],  # Truncate for logging
            budget=budget,
            reraise=False,
        ) as op:
            # Check circuit breaker state
            if self.circuit_breaker.is_open:
                logger.warning(
                    f"Circuit breaker open for LM Studio, using fallback for claim analysis"
                )
                result = self._fallback_claim_analysis(tile, purpose, budget)
                op.set_result(result)
                self._fallback_count += 1
                return result

            # Calculate distance from origin
            distance = math.sqrt(tile[0] ** 2 + tile[1] ** 2)

            # Build prompt
            user_prompt = CLAIM_ANALYSIS_PROMPT.format(
                x=tile[0],
                y=tile[1],
                distance=distance,
                purpose=purpose,
                budget=budget,
                reserved=reserved,
                consumed=consumed,
            )

            messages = [
                {"role": "system", "content": TECTONIC_AGENT_SYSTEM_PROMPT},
                {"role": "user", "content": user_prompt},
            ]

            # ERROR HANDLING: Wrap API call with circuit breaker
            try:
                with self.circuit_breaker:
                    response = await self.client.chat_completion(
                        messages=messages,
                        max_tokens=256,
                        temperature=0.7,
                    )

                    # Parse response
                    if response and "choices" in response and response["choices"]:
                        content = response["choices"][0]["message"]["content"]
                        parsed = extract_json_from_response(content)

                        if parsed:
                            result = ClaimAnalysisResult.from_dict(parsed)
                            op.set_result(result)
                            return result
                        else:
                            # Parse failed, use fallback
                            logger.warning(
                                "Failed to parse LLM response for claim analysis, using fallback"
                            )
                            result = self._fallback_claim_analysis(tile, purpose, budget)
                            op.set_result(result)
                            self._fallback_count += 1
                            return result

            except ExternalServiceError as e:
                # Circuit breaker is open or service unavailable
                logger.warning(f"LM Studio unavailable: {e}, using fallback")
                result = self._fallback_claim_analysis(tile, purpose, budget)
                op.set_result(result)
                self._fallback_count += 1
                return result

            except Exception as e:
                # Convert to domain-specific error and use fallback
                logger.error(f"Unexpected error in claim analysis: {e}")
                result = self._fallback_claim_analysis(tile, purpose, budget)
                op.set_result(result)
                self._fallback_count += 1
                return result

            # Fallback to simple calculation
            logger.warning("No valid response from LLM, using fallback calculation")
            result = self._fallback_claim_analysis(tile, purpose, budget)
            op.set_result(result)
            self._fallback_count += 1
            return result

    def _fallback_claim_analysis(
        self,
        tile: tuple[int, int],
        purpose: str,
        budget: float,
    ) -> ClaimAnalysisResult:
        """
        Fallback analysis when LLM is unavailable.

        Uses simple heuristic based on distance and budget.
        """
        distance = math.sqrt(tile[0] ** 2 + tile[1] ** 2)

        # Distance-based bidding: closer tiles worth more
        distance_factor = max(0.05, 1.0 - (distance / 100.0))
        recommended_bid = budget * 0.1 * distance_factor

        return ClaimAnalysisResult(
            recommended_bid=recommended_bid,
            confidence=0.3,  # Low confidence for fallback
            reasoning="Fallback heuristic analysis (LLM unavailable)",
        )

    async def should_counter_bid(
        self,
        original_bid: float,
        my_budget: float,
        tile: tuple[int, int],
        purpose: str = "",
        original_agent_id: str = "",
        my_reserved: float = 0.0,
        won_claims_count: int = 0,
    ) -> CounterBidDecision:
        """
        Ask LLM whether to submit a counter-bid.

        ERROR HANDLING: Comprehensive error handling with fallback decision.

        Args:
            original_bid: The bid amount to potentially counter
            my_budget: Agent's current budget
            tile: The tile coordinates
            purpose: Purpose of the original claim
            original_agent_id: ID of the agent making the original claim
            my_reserved: Agent's reserved budget
            won_claims_count: Number of claims agent has already won

        Returns:
            CounterBidDecision with recommendation
        """
        self._counter_bid_count += 1

        async with AsyncNeuralOperation(
            "should_counter_bid",
            tile=str(tile),
            original_bid=original_bid,
            reraise=False,
        ) as op:
            # Check circuit breaker
            if self.circuit_breaker.is_open:
                logger.warning("Circuit breaker open, using fallback for counter-bid decision")
                result = self._fallback_counter_bid(original_bid, my_budget)
                op.set_result(result)
                self._fallback_count += 1
                return result

            user_prompt = COUNTER_BID_PROMPT.format(
                x=tile[0],
                y=tile[1],
                original_bid=original_bid,
                purpose=purpose or "Unknown",
                original_agent_id=original_agent_id or "unknown",
                my_budget=my_budget,
                my_reserved=my_reserved,
                won_claims_count=won_claims_count,
            )

            messages = [
                {"role": "system", "content": TECTONIC_AGENT_SYSTEM_PROMPT},
                {"role": "user", "content": user_prompt},
            ]

            try:
                with self.circuit_breaker:
                    response = await self.client.chat_completion(
                        messages=messages,
                        max_tokens=256,
                        temperature=0.7,
                    )

                    if response and "choices" in response and response["choices"]:
                        content = response["choices"][0]["message"]["content"]
                        parsed = extract_json_from_response(content)

                        if parsed:
                            result = CounterBidDecision.from_dict(parsed)
                            op.set_result(result)
                            return result

            except ExternalServiceError as e:
                logger.warning(f"LM Studio unavailable for counter-bid: {e}")
                result = self._fallback_counter_bid(original_bid, my_budget)
                op.set_result(result)
                self._fallback_count += 1
                return result

            except Exception as e:
                logger.error(f"Unexpected error in counter-bid decision: {e}")
                result = self._fallback_counter_bid(original_bid, my_budget)
                op.set_result(result)
                self._fallback_count += 1
                return result

            # Fallback decision
            logger.warning("Failed to parse LLM response for counter-bid, using fallback")
            result = self._fallback_counter_bid(original_bid, my_budget)
            op.set_result(result)
            self._fallback_count += 1
            return result

    def _fallback_counter_bid(
        self,
        original_bid: float,
        my_budget: float,
    ) -> CounterBidDecision:
        """
        Fallback counter-bid decision when LLM is unavailable.

        Uses simple heuristic: counter if bid is affordable.
        """
        # Simple heuristic: counter if bid is less than 30% of budget
        should_counter = original_bid < my_budget * 0.3

        return CounterBidDecision(
            should_counter=should_counter,
            suggested_counter_bid=original_bid * 1.1 if should_counter else None,
            confidence=0.3,
            reasoning="Fallback heuristic decision (LLM unavailable)",
        )

    async def infer_district_purpose(
        self,
        agents: list[dict[str, Any]],
        center: tuple[float, float] = (0.0, 0.0),
        radius: float = 10.0,
    ) -> DistrictPurposeResult:
        """
        Ask LLM to infer collective purpose of agent cluster.

        ERROR HANDLING: Comprehensive error handling with fallback result.

        Args:
            agents: List of agent info dicts with agent_id, purpose, strategy_type
            center: Center of the cluster
            radius: Radius of the cluster

        Returns:
            DistrictPurposeResult with inferred purpose
        """
        self._district_purpose_count += 1

        async with AsyncNeuralOperation(
            "infer_district_purpose",
            agent_count=len(agents),
            center=str(center),
            radius=radius,
            reraise=False,
        ) as op:
            # Check circuit breaker
            if self.circuit_breaker.is_open:
                logger.warning("Circuit breaker open, using fallback for district purpose")
                result = self._fallback_district_purpose(agents)
                op.set_result(result)
                self._fallback_count += 1
                return result

            agents_info = format_agents_info(agents)
            agent_details = "\n".join([
                f"  - {agent.get('agent_id', 'unknown')}: {agent.get('purpose', 'unknown')}"
                for agent in agents
            ])

            user_prompt = DISTRICT_PURPOSE_PROMPT.format(
                agents_info=agents_info,
                center_x=center[0],
                center_y=center[1],
                radius=radius,
                total_agents=len(agents),
                agent_details=agent_details,
            )

            messages = [
                {"role": "system", "content": TECTONIC_AGENT_SYSTEM_PROMPT},
                {"role": "user", "content": user_prompt},
            ]

            try:
                with self.circuit_breaker:
                    response = await self.client.chat_completion(
                        messages=messages,
                        max_tokens=512,
                        temperature=0.7,
                    )

                    if response and "choices" in response and response["choices"]:
                        content = response["choices"][0]["message"]["content"]
                        parsed = extract_json_from_response(content)

                        if parsed:
                            result = DistrictPurposeResult.from_dict(parsed)
                            op.set_result(result)
                            return result

            except ExternalServiceError as e:
                logger.warning(f"LM Studio unavailable for district purpose: {e}")
                result = self._fallback_district_purpose(agents)
                op.set_result(result)
                self._fallback_count += 1
                return result

            except Exception as e:
                logger.error(f"Unexpected error in district purpose inference: {e}")
                result = self._fallback_district_purpose(agents)
                op.set_result(result)
                self._fallback_count += 1
                return result

            # Fallback
            logger.warning("Failed to parse LLM response for district purpose")
            result = self._fallback_district_purpose(agents)
            op.set_result(result)
            self._fallback_count += 1
            return result

    def _fallback_district_purpose(
        self,
        agents: list[dict[str, Any]],
    ) -> DistrictPurposeResult:
        """
        Fallback district purpose inference when LLM is unavailable.

        Uses simple aggregation of agent purposes.
        """
        if not agents:
            return DistrictPurposeResult(
                inferred_purpose="empty",
                purpose_description="No agents in district",
                cohesion_score=0.0,
                key_activities=[],
            )

        # Aggregate purposes
        purposes = [agent.get("purpose", "unknown") for agent in agents]
        purpose_counts = {}
        for purpose in purposes:
            purpose_counts[purpose] = purpose_counts.get(purpose, 0) + 1

        # Get most common purpose
        primary_purpose = max(purpose_counts, key=purpose_counts.get)
        cohesion = purpose_counts[primary_purpose] / len(agents)

        return DistrictPurposeResult(
            inferred_purpose=primary_purpose,
            purpose_description=f"Aggregated from {len(agents)} agents (LLM unavailable)",
            cohesion_score=cohesion,
            key_activities=list(set(purposes))[:5],
        )

    async def name_district(
        self,
        purposes: list[str],
        cohesion: float,
        tile_count: int = 1,
        center: tuple[int, int] = (0, 0),
    ) -> DistrictNameResult:
        """
        Generate a meaningful district name.

        ERROR HANDLING: Comprehensive error handling with fallback name generation.

        Args:
            purposes: List of agent purposes in the district
            cohesion: Cohesion score (0-1)
            tile_count: Number of tiles in the district
            center: Center coordinates of the district

        Returns:
            DistrictNameResult with generated name
        """
        self._district_naming_count += 1

        async with AsyncNeuralOperation(
            "name_district",
            purpose_count=len(purposes),
            cohesion=cohesion,
            reraise=False,
        ) as op:
            # Check circuit breaker
            if self.circuit_breaker.is_open:
                logger.warning("Circuit breaker open, using fallback for district naming")
                result = self._fallback_district_name(purposes)
                op.set_result(result)
                self._fallback_count += 1
                return result

            purpose_list = format_purpose_list(purposes)
            primary_purpose = purposes[0] if purposes else "unknown"

            user_prompt = DISTRICT_NAMING_PROMPT.format(
                primary_purpose=primary_purpose,
                cohesion=cohesion,
                tile_count=tile_count,
                center_x=center[0],
                center_y=center[1],
                purpose_list=purpose_list,
            )

            messages = [
                {"role": "system", "content": TECTONIC_AGENT_SYSTEM_PROMPT},
                {"role": "user", "content": user_prompt},
            ]

            try:
                with self.circuit_breaker:
                    response = await self.client.chat_completion(
                        messages=messages,
                        max_tokens=256,
                        temperature=0.8,  # Higher temperature for more creative names
                    )

                    if response and "choices" in response and response["choices"]:
                        content = response["choices"][0]["message"]["content"]
                        parsed = extract_json_from_response(content)

                        if parsed:
                            result = DistrictNameResult.from_dict(parsed)
                            op.set_result(result)
                            return result

            except ExternalServiceError as e:
                logger.warning(f"LM Studio unavailable for district naming: {e}")
                result = self._fallback_district_name(purposes)
                op.set_result(result)
                self._fallback_count += 1
                return result

            except Exception as e:
                logger.error(f"Unexpected error in district naming: {e}")
                result = self._fallback_district_name(purposes)
                op.set_result(result)
                self._fallback_count += 1
                return result

            # Fallback name generation
            logger.warning("Failed to parse LLM response for district naming")
            result = self._fallback_district_name(purposes)
            op.set_result(result)
            self._fallback_count += 1
            return result

    def _fallback_district_name(
        self,
        purposes: list[str],
    ) -> DistrictNameResult:
        """
        Fallback district name generation when LLM is unavailable.

        Uses simple naming based on primary purpose.
        """
        primary_purpose = purposes[0] if purposes else "unknown"

        # Simple name generation
        name = f"{primary_purpose.title()} District"

        # Generate some alternatives
        alternatives = []
        if len(purposes) > 1:
            alternatives.append(f"{purposes[1].title()} District")
        if len(purposes) > 2:
            alternatives.append(f"{purposes[2].title()} Zone")
        alternatives.append(f"District {hash(tuple(purposes)) % 1000}")

        return DistrictNameResult(
            primary_name=name,
            alternative_names=alternatives[:3],
            reasoning="Fallback name generation (LLM unavailable)",
        )

    async def close(self) -> None:
        """Close the underlying client and cleanup resources."""
        try:
            await self.client.close()
        except Exception as e:
            logger.error(f"Error closing client: {e}")

    def get_stats(self) -> dict[str, Any]:
        """Get bridge statistics including error handling metrics."""
        return {
            "analysis_count": self._analysis_count,
            "counter_bid_count": self._counter_bid_count,
            "district_purpose_count": self._district_purpose_count,
            "district_naming_count": self._district_naming_count,
            "fallback_count": self._fallback_count,
            "circuit_breaker_state": self.circuit_breaker.state.value,
            "circuit_breaker_failures": self.circuit_breaker.get_stats().failure_count,
            "client_stats": self.client.get_stats(),
        }

    def reset_stats(self) -> None:
        """Reset statistics."""
        self._analysis_count = 0
        self._counter_bid_count = 0
        self._district_purpose_count = 0
        self._district_naming_count = 0
        self._fallback_count = 0
        self.client.reset_stats()

    async def __aenter__(self):
        """Async context manager entry."""
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit."""
        await self.close()

    async def check_lm_studio_available(self) -> bool:
        """
        Check if LM Studio is running and accessible.

        ERROR HANDLING: Returns False on any error instead of raising.
        """
        import aiohttp

        try:
            async with aiohttp.ClientSession() as session, session.get(
                f"{self.lm_studio_url}/models",
                timeout=aiohttp.ClientTimeout(total=5)
            ) as response:
                return response.status == 200
        except Exception as e:
            logger.debug(f"LM Studio availability check failed: {e}")
            return False


# =============================================================================
# TESTING UTILITIES
# =============================================================================

async def test_error_handling():
    """
    Test error handling in the PixelBrainBridge.

    Run this to verify error handling works correctly.
    """
    print("Testing PixelBrainBridge error handling...")

    async with PixelBrainBridge() as bridge:
        # Test 1: Normal operation (if LM Studio is available)
        print("\n1. Testing normal claim analysis...")
        result = await bridge.analyze_claim(
            tile=(10, 20),
            purpose="Build research facility",
            budget=100.0,
        )
        print(f"   Result: bid={result.recommended_bid:.2f}, confidence={result.confidence:.2f}")
        print(f"   Reasoning: {result.reasoning}")

        # Test 2: Counter-bid decision
        print("\n2. Testing counter-bid decision...")
        decision = await bridge.should_counter_bid(
            original_bid=25.0,
            my_budget=80.0,
            tile=(10, 20),
        )
        print(f"   Should counter: {decision.should_counter}")
        print(f"   Suggested bid: {decision.suggested_counter_bid}")

        # Test 3: District purpose inference
        print("\n3. Testing district purpose inference...")
        agents = [
            {"agent_id": "agent1", "purpose": "research"},
            {"agent_id": "agent2", "purpose": "research"},
            {"agent_id": "agent3", "purpose": "development"},
        ]
        purpose = await bridge.infer_district_purpose(agents)
        print(f"   Inferred purpose: {purpose.inferred_purpose}")
        print(f"   Cohesion: {purpose.cohesion_score:.2f}")

        # Test 4: District naming
        print("\n4. Testing district naming...")
        name = await bridge.name_district(
            purposes=["research", "development", "testing"],
            cohesion=0.85,
        )
        print(f"   Name: {name.primary_name}")
        print(f"   Alternatives: {name.alternative_names}")

        # Print stats
        print("\n5. Statistics:")
        stats = bridge.get_stats()
        print(f"   Analysis count: {stats['analysis_count']}")
        print(f"   Fallback count: {stats['fallback_count']}")
        print(f"   Circuit breaker: {stats['circuit_breaker_state']}")

    print("\n✓ Error handling tests complete")


if __name__ == "__main__":
    import asyncio
    asyncio.run(test_error_handling())
