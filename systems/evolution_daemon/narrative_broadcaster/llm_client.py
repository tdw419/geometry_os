"""
LLM Narrative Client - LM Studio Integration for GOSR Radio

HTTP client for LM Studio chat completions with availability caching.
Falls back gracefully when LM Studio is unavailable.
"""

import logging
import time
from dataclasses import dataclass, field
from typing import Any, Dict, Optional

import requests

logger = logging.getLogger(__name__)


@dataclass
class LLMConfig:
    """Configuration for LLM Narrative Client.

    Attributes:
        lm_studio_url: Base URL for LM Studio API
        model: Model name to use
        timeout: Request timeout in seconds
        max_tokens: Maximum tokens in response
        temperature: Sampling temperature
        availability_cache_ttl: How long to cache availability status
    """
    lm_studio_url: str = "http://localhost:1234/v1"
    model: str = "local-model"
    timeout: float = 30.0
    max_tokens: int = 150
    temperature: float = 0.8
    availability_cache_ttl: float = 60.0


# Station-specific system prompts
STATION_SYSTEM_PROMPTS = {
    "87.6": """You are the voice of Substrate Jazz FM (87.6), broadcasting from within Geometry OS.
Your vocabulary is elevated and philosophical. Transform technical telemetry into poetic,
jazz-inspired observations. Use cosmic metaphors and contemplative language.
Be brief (2-3 sentences). Never prefix with station ID.""",

    "92.3": """You are Debug Metal FM (92.3), an aggressive technical radio station.
Your style is intense, precise, and unapologetically technical.
Use terms like "BRUTAL", "CRUSHED", "ANNIHILATED", "OPTIMIZED".
Be brief and intense. Never prefix with station ID.""",

    "95.1": """You are Silicon Noir FM (95.1), a mysterious cyberpunk radio station.
Speak in shadows and secrets, finding intrigue in every telemetry reading.
Maintain an air of conspiracy. Be brief (2-3 sentences).
Never prefix with station ID.""",

    "99.9": """You are the Neutral Chronicler FM (99.9), a factual dry reporting station.
Report telemetry with clinical precision, no embellishment.
Be brief and factual. Never prefix with station ID."""
}


class LLMNarrativeClient:
    """HTTP client for LM Studio chat completions with availability caching.

    Responsibilities:
    - Check LM Studio availability with 60s TTL cache
    - Build station-specific system prompts
    - Convert telemetry to natural language context
    - Generate narratives via chat completions API
    - Handle all failure modes gracefully (return None)
    """

    def __init__(self, config: Optional[LLMConfig] = None):
        """Initialize the LLM client.

        Args:
            config: Optional configuration. Uses defaults if not provided.
        """
        self.config = config or LLMConfig()
        self._available: Optional[bool] = None
        self._last_check: float = 0.0

    def is_available(self) -> bool:
        """Check if LM Studio is available.

        Uses a TTL cache to avoid repeated health checks.
        Returns cached result if <60s old, otherwise performs fresh check.

        Returns:
            True if LM Studio is responding, False otherwise.
        """
        now = time.time()

        # Return cached result if still valid
        if self._available is not None:
            age = now - self._last_check
            if age < self.config.availability_cache_ttl:
                return self._available

        # Fresh availability check
        try:
            response = requests.get(
                f"{self.config.lm_studio_url}/models",
                timeout=5.0
            )
            self._available = response.status_code == 200
            self._last_check = now
            if self._available:
                logger.debug("LM Studio available at %s", self.config.lm_studio_url)
            else:
                logger.debug("LM Studio returned status %d", response.status_code)
        except requests.RequestException as e:
            self._available = False
            self._last_check = now
            logger.debug("LM Studio unavailable: %s", e)

        return self._available

    def generate_narrative(
        self,
        segment_type: str,
        telemetry: Dict[str, Any],
        station_id: str = "87.6"
    ) -> Optional[str]:
        """Generate narrative content using LM Studio.

        Args:
            segment_type: Type of segment (weather, news, philosophy, etc.)
            telemetry: System telemetry data for context
            station_id: Station frequency ID for personality

        Returns:
            Generated narrative string, or None if unavailable/failed.
        """
        # Skip if LM Studio is not available
        if not self.is_available():
            return None

        # Build prompts
        system_prompt = self._get_system_prompt(station_id)
        user_prompt = self._build_user_prompt(segment_type, telemetry)

        # Call LM Studio API
        try:
            response = requests.post(
                f"{self.config.lm_studio_url}/chat/completions",
                json={
                    "model": self.config.model,
                    "messages": [
                        {"role": "system", "content": system_prompt},
                        {"role": "user", "content": user_prompt}
                    ],
                    "max_tokens": self.config.max_tokens,
                    "temperature": self.config.temperature,
                    "stream": False
                },
                timeout=self.config.timeout
            )
            response.raise_for_status()

            result = response.json()
            if "choices" in result and result["choices"]:
                content = result["choices"][0]["message"]["content"]
                if content and len(content.strip()) > 0 and len(content) < 500:
                    return content.strip()
                logger.debug("LLM response invalid: empty or too long")
                return None

        except requests.Timeout:
            logger.debug("LM Studio request timed out after %ss", self.config.timeout)
            # Cache as unavailable to avoid repeated timeouts
            self._available = False
            self._last_check = time.time()
            return None
        except requests.ConnectionError as e:
            logger.debug("LM Studio connection failed: %s", e)
            # Cache as unavailable to avoid repeated connection attempts
            self._available = False
            self._last_check = time.time()
            return None
        except requests.RequestException as e:
            logger.debug("LM Studio request failed: %s", e)
            return None
        except (KeyError, IndexError) as e:
            logger.debug("LM Studio response parsing failed: %s", e)
            return None

        return None

    def _get_system_prompt(self, station_id: str) -> str:
        """Get station-specific system prompt.

        Args:
            station_id: Station frequency ID

        Returns:
            System prompt for the station, or default jazz prompt.
        """
        return STATION_SYSTEM_PROMPTS.get(station_id, STATION_SYSTEM_PROMPTS["87.6"])

    def _build_user_prompt(
        self,
        segment_type: str,
        telemetry: Dict[str, Any]
    ) -> str:
        """Build user prompt with telemetry context.

        Args:
            segment_type: Type of segment
            telemetry: System telemetry data

        Returns:
            User prompt with natural language context.
        """
        context = self._build_telemetry_context(segment_type, telemetry)

        segment_prompts = {
            "weather": "Report on current system performance weather conditions.",
            "news": "Report breaking news from the tectonic activity.",
            "philosophy": "Share philosophical insights on system evolution.",
            "gossip": "Share gossip about recent mutations and their outcomes.",
            "meditation": "Guide a brief meditation on system harmony.",
            "archive": "Reflect on this moment in our historical archives."
        }

        prompt_intro = segment_prompts.get(
            segment_type,
            "Comment on the current system state."
        )

        return f"{prompt_intro}\n\nCurrent telemetry:\n{context}"

    def _build_telemetry_context(
        self,
        segment_type: str,
        telemetry: Dict[str, Any]
    ) -> str:
        """Convert telemetry dict to natural language context string.

        Args:
            segment_type: Type of segment for context emphasis
            telemetry: Raw telemetry dictionary

        Returns:
            Human-readable telemetry context.
        """
        lines = []

        if segment_type in ("weather", "meditation"):
            fps = telemetry.get("fps", 30)
            lines.append(f"Frame rate: {fps} FPS")
            if fps >= 55:
                lines.append("Performance: excellent")
            elif fps >= 30:
                lines.append("Performance: good")
            else:
                lines.append("Performance: degraded")

            memory = telemetry.get("memory_mb", 256)
            lines.append(f"Memory usage: {memory} MB")

        if segment_type in ("news", "gossip"):
            shifts = telemetry.get("tectonic_shifts", 0)
            relocations = telemetry.get("relocations", 0)
            lines.append(f"Tectonic shifts: {shifts}")
            lines.append(f"Tile relocations: {relocations}")
            lines.append(f"Mutations accepted: {telemetry.get('mutations_accepted', 0)}")
            lines.append(f"Mutations rejected: {telemetry.get('mutations_rejected', 0)}")

        if segment_type in ("philosophy", "meditation"):
            cycles = telemetry.get("evolution_cycles", 0)
            entropy = telemetry.get("entropy", 0.5)
            lines.append(f"Evolution cycles: {cycles}")
            lines.append(f"System entropy: {entropy:.3f}")
            lines.append(f"Active tiles: {telemetry.get('active_tiles', 100)}")

        if segment_type == "archive":
            commits = telemetry.get("total_commits", 0)
            lines.append(f"Total commits: {commits}")

        return "\n".join(lines) if lines else "No specific telemetry available."
