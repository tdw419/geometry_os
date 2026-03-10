"""
PixelBrainBridge - Connects tectonic agents to live LLM inference.

This module provides the main bridge between tectonic agents and LM Studio,
enabling intelligent decision-making for tile claims, counter-bids, and
district management.

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

import asyncio
import json
import logging
import math
import re
from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple, Any

from systems.pixel_brain.async_inference import AsyncInferenceClient
from systems.pixel_brain.prompts import (
    TECTONIC_AGENT_SYSTEM_PROMPT,
    CLAIM_ANALYSIS_PROMPT,
    COUNTER_BID_PROMPT,
    DISTRICT_PURPOSE_PROMPT,
    DISTRICT_NAMING_PROMPT,
    format_agents_info,
    format_purpose_list,
)

logger = logging.getLogger("pixel_brain.inference_bridge")


@dataclass
class ClaimAnalysisResult:
    """Result of claim analysis from LLM."""

    recommended_bid: float
    confidence: float
    reasoning: str

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "ClaimAnalysisResult":
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
    suggested_counter_bid: Optional[float]
    confidence: float
    reasoning: str

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "CounterBidDecision":
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
    key_activities: List[str]

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "DistrictPurposeResult":
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
    alternative_names: List[str]
    reasoning: str

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "DistrictNameResult":
        """Create from parsed JSON response."""
        return cls(
            primary_name=data.get("primary_name", "Unnamed District"),
            alternative_names=data.get("alternative_names", []),
            reasoning=data.get("reasoning", ""),
        )


def extract_json_from_response(content: str) -> Optional[Dict[str, Any]]:
    """
    Extract JSON from LLM response that may contain markdown code blocks.

    Args:
        content: Raw LLM response content

    Returns:
        Parsed JSON dict or None
    """
    # Try to find JSON in markdown code blocks
    json_pattern = r"```(?:json)?\s*([\s\S]*?)```"
    matches = re.findall(json_pattern, content)

    for match in matches:
        try:
            return json.loads(match.strip())
        except json.JSONDecodeError:
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
        except json.JSONDecodeError:
            continue

    return None


class PixelBrainBridge:
    """
    Connects tectonic agents to live LLM inference.

    This bridge provides high-level methods for tectonic decisions,
    handling the complexity of prompt construction, LLM communication,
    and response parsing.

    Attributes:
        lm_studio_url: URL of the LM Studio API
        model: Model name to use
        client: AsyncInferenceClient for API calls
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

        # Metrics
        self._analysis_count = 0
        self._counter_bid_count = 0
        self._district_purpose_count = 0
        self._district_naming_count = 0

    async def analyze_claim(
        self,
        tile: Tuple[int, int],
        purpose: str,
        budget: float,
        reserved: float = 0.0,
        consumed: float = 0.0,
    ) -> ClaimAnalysisResult:
        """
        Ask LLM for optimal bid on a tile claim.

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

        # Make request
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
                return ClaimAnalysisResult.from_dict(parsed)

        # Fallback to simple calculation
        logger.warning("Failed to parse LLM response, using fallback calculation")
        fallback_bid = budget * 0.1  # 10% of budget as default
        return ClaimAnalysisResult(
            recommended_bid=fallback_bid,
            confidence=0.3,
            reasoning="Fallback calculation due to LLM parse failure",
        )

    async def should_counter_bid(
        self,
        original_bid: float,
        my_budget: float,
        tile: Tuple[int, int],
        purpose: str = "",
        original_agent_id: str = "",
        my_reserved: float = 0.0,
        won_claims_count: int = 0,
    ) -> CounterBidDecision:
        """
        Ask LLM whether to submit a counter-bid.

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

        response = await self.client.chat_completion(
            messages=messages,
            max_tokens=256,
            temperature=0.7,
        )

        if response and "choices" in response and response["choices"]:
            content = response["choices"][0]["message"]["content"]
            parsed = extract_json_from_response(content)

            if parsed:
                return CounterBidDecision.from_dict(parsed)

        # Fallback decision
        logger.warning("Failed to parse LLM response for counter-bid, using fallback")
        # Simple heuristic: counter if bid is less than 30% of budget
        should_counter = original_bid < my_budget * 0.3
        return CounterBidDecision(
            should_counter=should_counter,
            suggested_counter_bid=original_bid * 1.1 if should_counter else None,
            confidence=0.3,
            reasoning="Fallback heuristic decision",
        )

    async def infer_district_purpose(
        self,
        agents: List[Dict[str, Any]],
        center: Tuple[float, float] = (0.0, 0.0),
        radius: float = 10.0,
    ) -> DistrictPurposeResult:
        """
        Ask LLM to infer collective purpose of agent cluster.

        Args:
            agents: List of agent info dicts with agent_id, purpose, strategy_type
            center: Center of the cluster
            radius: Radius of the cluster

        Returns:
            DistrictPurposeResult with inferred purpose
        """
        self._district_purpose_count += 1

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

        response = await self.client.chat_completion(
            messages=messages,
            max_tokens=512,
            temperature=0.7,
        )

        if response and "choices" in response and response["choices"]:
            content = response["choices"][0]["message"]["content"]
            parsed = extract_json_from_response(content)

            if parsed:
                return DistrictPurposeResult.from_dict(parsed)

        # Fallback
        logger.warning("Failed to parse LLM response for district purpose")
        return DistrictPurposeResult(
            inferred_purpose="unknown",
            purpose_description="Unable to infer purpose",
            cohesion_score=0.5,
            key_activities=[],
        )

    async def name_district(
        self,
        purposes: List[str],
        cohesion: float,
        tile_count: int = 1,
        center: Tuple[int, int] = (0, 0),
    ) -> DistrictNameResult:
        """
        Generate a meaningful district name.

        Args:
            purposes: List of agent purposes in the district
            cohesion: Cohesion score (0-1)
            tile_count: Number of tiles in the district
            center: Center coordinates of the district

        Returns:
            DistrictNameResult with generated name
        """
        self._district_naming_count += 1

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

        response = await self.client.chat_completion(
            messages=messages,
            max_tokens=256,
            temperature=0.8,  # Higher temperature for more creative names
        )

        if response and "choices" in response and response["choices"]:
            content = response["choices"][0]["message"]["content"]
            parsed = extract_json_from_response(content)

            if parsed:
                return DistrictNameResult.from_dict(parsed)

        # Fallback name generation
        logger.warning("Failed to parse LLM response for district naming")
        return DistrictNameResult(
            primary_name=f"{primary_purpose.title()} District",
            alternative_names=[],
            reasoning="Fallback name generation",
        )

    async def close(self) -> None:
        """Close the underlying client and cleanup resources."""
        await self.client.close()

    def get_stats(self) -> Dict[str, Any]:
        """Get bridge statistics."""
        return {
            "analysis_count": self._analysis_count,
            "counter_bid_count": self._counter_bid_count,
            "district_purpose_count": self._district_purpose_count,
            "district_naming_count": self._district_naming_count,
            "client_stats": self.client.get_stats(),
        }

    def reset_stats(self) -> None:
        """Reset statistics."""
        self._analysis_count = 0
        self._counter_bid_count = 0
        self._district_purpose_count = 0
        self._district_naming_count = 0
        self.client.reset_stats()

    async def __aenter__(self):
        """Async context manager entry."""
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit."""
        await self.close()

    async def check_lm_studio_available(self) -> bool:
        """Check if LM Studio is running and accessible."""
        import aiohttp

        try:
            async with aiohttp.ClientSession() as session:
                async with session.get(
                    f"{self.lm_studio_url}/models",
                    timeout=aiohttp.ClientTimeout(total=5)
                ) as response:
                    return response.status == 200
        except (aiohttp.ClientError, asyncio.TimeoutError):
            return False
