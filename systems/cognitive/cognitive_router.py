"""
Unified Cognitive Router

Single entry point for all LLM operations in Geometry OS.
Routes requests through PixelBrain by default, with external fallbacks.
"""

import logging
import time
from typing import Any, Optional

logger = logging.getLogger(__name__)


class CognitiveRouter:
    """
    Unified routing for all cognitive operations in Geometry OS.
    Implements the "Tech Lead" pattern:
    - Fast, native tasks -> PixelBrain
    - Complex, architectural, or low-PAS tasks -> LM Studio (Escalation)
    """

    def __init__(self, config: Optional["CognitiveConfig"] = None):
        from .cognitive_config import get_cognitive_config
        self.config = config or get_cognitive_config()
        self._backends: dict[str, Any] = {}
        self._pas_threshold = 0.8  # Threshold for automatic escalation

    async def generate(
        self,
        prompt: str,
        max_tokens: int = 100,
        temperature: float = 0.7,
        engine: str | None = None,
        allow_fallback: bool = True,
        complexity: float = 0.5,
        **kwargs
    ) -> str:
        """
        Generate text through the cognitive bus with intelligent routing.

        Args:
            prompt: Input prompt
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature
            engine: Specific engine to use (None for auto-route)
            allow_fallback: Whether to fall back if primary fails
            complexity: Task complexity (0.0 to 1.0)

        Returns:
            Generated text or error message
        """
        # 1. Determine the best engine based on routing policy
        if engine:
            engine_name = engine
        else:
            engine_name = self._route_task(prompt, complexity)

        # 2. Try selected engine
        try:
            backend = self._get_backend(engine_name)
            result = await self._execute_request(backend, prompt, max_tokens, temperature, **kwargs)
            if result:
                return result
        except Exception as e:
            logger.warning(f"Engine {engine_name} failed: {e}")

            if not allow_fallback:
                return f"[Error: {engine_name} unavailable]"

        # 3. Try fallback (LM Studio for deep reasoning, PixelBrain for speed)
        fallback = self.config.fallback_engine if engine_name != self.config.fallback_engine else self.config.default_engine
        if allow_fallback:
            try:
                backend = self._get_backend(fallback)
                result = await self._execute_request(backend, prompt, max_tokens, temperature, **kwargs)
                if result:
                    logger.info(f"Used fallback engine: {fallback}")
                    return result
            except Exception as e:
                logger.error(f"Fallback engine {fallback} also failed: {e}")

        return "[Error: No cognitive engines available]"

    def _route_task(self, prompt: str, complexity: float) -> str:
        """
        Route task based on complexity and system health.
        """
        # Check current PAS (Predictive Agent Stability)
        current_pas = self._get_current_pas()

        # Policy 1: High complexity or low stability -> Escalate to LM Studio (Tech Lead)
        if complexity > 0.8 or current_pas < self._pas_threshold:
            if self.config.is_available("lmstudio"):
                logger.debug(f"Escalating task to LM Studio (Complexity: {complexity}, PAS: {current_pas:.2f})")
                return "lmstudio"

        # Policy 2: Explicit architectural keywords -> Escalate
        arch_keywords = ["refactor", "architecture", "design pattern", "optimize kernel"]
        if any(kw in prompt.lower() for kw in arch_keywords):
            if self.config.is_available("lmstudio"):
                return "lmstudio"

        # Default to PixelBrain for speed and local efficiency
        return self.config.default_engine

    async def _execute_request(self, backend, prompt, max_tokens, temperature, **kwargs) -> str | None:
        """Execute request on backend regardless of sync/async implementation."""
        if hasattr(backend, 'generate'):
            import asyncio
            if asyncio.iscoroutinefunction(backend.generate):
                result = await backend.generate(prompt=prompt, max_tokens=max_tokens, temperature=temperature, **kwargs)
            else:
                result = backend.generate(prompt=prompt, max_tokens=max_tokens, temperature=temperature, **kwargs)

            return result if isinstance(result, str) else result.get('text', '')

        # Support for LMStudio client style (generate_narrative or similar)
        if hasattr(backend, 'generate_narrative'):
            # Adapt for narrative client if needed
            return backend.generate_narrative("philosophy", {"prompt": prompt})

        return None

    def _get_current_pas(self) -> float:
        """Get current system health score."""
        try:
            from systems.health.software_shm import SoftwareSHM
            shm = SoftwareSHM()
            return shm.check_health().score
        except Exception:
            return 1.0  # Assume healthy if unknown

    def _get_backend(self, engine_name: str) -> Any:
        """Get or create backend for engine."""
        if engine_name in self._backends:
            return self._backends[engine_name]

        if engine_name == "pixelbrain":
            backend = self._get_pixelbrain()
        elif engine_name == "lmstudio":
            backend = self._get_lmstudio()
        else:
            raise ValueError(f"Unknown engine: {engine_name}")

        self._backends[engine_name] = backend
        return backend

    def _get_pixelbrain(self):
        """Get PixelBrain backend."""
        from systems.swarm.llm_backend import get_swarm_llm_backend
        return get_swarm_llm_backend()

    def _get_lmstudio(self):
        """Get LM Studio backend for general completions."""
        return LMStudioBackend()


class LMStudioBackend:
    """Direct LM Studio API client for cognitive routing."""

    def __init__(self, base_url: str = "http://localhost:1234/v1", model: str = "qwen2.5-coder-7b-instruct"):
        self.base_url = base_url
        self.model = model
        self._available = None
        self._last_check = 0

    def is_available(self) -> bool:
        """Check if LM Studio is running."""
        now = time.time()
        if self._available is not None and (now - self._last_check) < 60:
            return self._available

        try:
            import requests
            response = requests.get(f"{self.base_url}/models", timeout=2)
            self._available = response.status_code == 200
            self._last_check = now
        except Exception:
            self._available = False
            self._last_check = now

        return self._available

    async def generate(self, prompt: str, max_tokens: int = 100, temperature: float = 0.7, **kwargs) -> str:
        """Generate text via LM Studio chat completions API."""
        import asyncio

        import requests

        if not self.is_available():
            raise ConnectionError("LM Studio not available")

        try:
            response = await asyncio.get_event_loop().run_in_executor(
                None,
                lambda: requests.post(
                    f"{self.base_url}/chat/completions",
                    json={
                        "model": self.model,
                        "messages": [
                            {"role": "system", "content": "You are a helpful AI that responds precisely as requested."},
                            {"role": "user", "content": prompt}
                        ],
                        "max_tokens": max_tokens,
                        "temperature": temperature,
                        "stream": False
                    },
                    timeout=30
                )
            )

            if response.status_code == 200:
                result = response.json()
                if "choices" in result and result["choices"]:
                    content = result["choices"][0]["message"]["content"]
                    return content

            raise ConnectionError(f"LM Studio returned status {response.status_code}")

        except requests.Timeout:
            raise TimeoutError("LM Studio request timed out")
        except requests.RequestException as e:
            raise ConnectionError(f"LM Studio request failed: {e}")


# Singleton
_router_instance: CognitiveRouter | None = None


def get_cognitive_router() -> CognitiveRouter:
    """Get global CognitiveRouter singleton."""
    global _router_instance
    if _router_instance is None:
        _router_instance = CognitiveRouter()
    return _router_instance


def reset_cognitive_router():
    """Reset router singleton (for testing)."""
    global _router_instance
    _router_instance = None
