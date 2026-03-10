"""
Unified Cognitive Router

Single entry point for all LLM operations in Geometry OS.
Routes requests through PixelBrain by default, with external fallbacks.
"""

import logging
from typing import Optional, Dict, Any

logger = logging.getLogger(__name__)


class CognitiveRouter:
    """
    Unified routing for all cognitive operations.

    Usage:
        router = CognitiveRouter()
        result = await router.generate("Write a function")
    """

    def __init__(self, config: Optional["CognitiveConfig"] = None):
        from .cognitive_config import get_cognitive_config
        self.config = config or get_cognitive_config()
        self._backends: Dict[str, Any] = {}

    async def generate(
        self,
        prompt: str,
        max_tokens: int = 100,
        temperature: float = 0.7,
        engine: Optional[str] = None,
        allow_fallback: bool = True,
        **kwargs
    ) -> str:
        """
        Generate text through the cognitive bus.

        Args:
            prompt: Input prompt
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature
            engine: Specific engine to use (None for default)
            allow_fallback: Whether to fall back if primary fails

        Returns:
            Generated text or error message
        """
        engine_name = engine or self.config.default_engine

        # Try primary engine
        try:
            backend = self._get_backend(engine_name)
            if hasattr(backend, 'generate'):
                result = await backend.generate(
                    prompt=prompt,
                    max_tokens=max_tokens,
                    temperature=temperature,
                    **kwargs
                )
                return result if isinstance(result, str) else result.get('text', '')
        except Exception as e:
            logger.warning(f"Engine {engine_name} failed: {e}")

            if not allow_fallback:
                return f"[Error: {engine_name} unavailable]"

        # Try fallback
        if allow_fallback and engine_name != self.config.fallback_engine:
            try:
                backend = self._get_backend(self.config.fallback_engine)
                if hasattr(backend, 'generate'):
                    result = await backend.generate(
                        prompt=prompt,
                        max_tokens=max_tokens,
                        temperature=temperature,
                        **kwargs
                    )
                    logger.info(f"Used fallback engine: {self.config.fallback_engine}")
                    return result if isinstance(result, str) else result.get('text', '')
            except Exception as e:
                logger.error(f"Fallback engine also failed: {e}")

        return "[Error: No cognitive engines available]"

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
        """Get LM Studio backend."""
        from systems.pixel_llm.lm_studio_integration import LMStudioClient
        return LMStudioClient()


# Singleton
_router_instance: Optional[CognitiveRouter] = None


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
