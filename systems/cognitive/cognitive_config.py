"""
Cognitive Configuration System

Provides unified configuration for all LLM backends in Geometry OS.
Default is PixelBrain (native), with optional external fallbacks.
"""

import os
import socket
import logging
from typing import Optional, Any, Dict
from enum import Enum

logger = logging.getLogger(__name__)


class CognitiveEngine(Enum):
    """Available cognitive engines."""
    PIXELBRAIN = "pixelbrain"
    LMSTUDIO = "lmstudio"
    OPENAI = "openai"
    ANTHROPIC = "anthropic"


class CognitiveConfig:
    """
    Configuration for cognitive engine selection.

    Usage:
        config = CognitiveConfig()
        engine = config.get_engine()
        result = await engine.generate("Hello")
    """

    def __init__(
        self,
        default_engine: Optional[str] = None,
        fallback_engine: Optional[str] = None,
        pixelbrain_path: Optional[str] = None
    ):
        # Default engine from env or parameter
        env_default = os.environ.get("COGNITIVE_ENGINE", "").lower()
        self.default_engine = default_engine or env_default or "pixelbrain"

        # Fallback when default unavailable
        self.fallback_engine = fallback_engine or "lmstudio"

        # PixelBrain atlas path
        self.pixelbrain_path = pixelbrain_path

        # Cache backends
        self._backends: Dict[str, Any] = {}

    def is_available(self, engine: str) -> bool:
        """Check if a cognitive engine is available."""
        if engine == "pixelbrain":
            return self._check_pixelbrain_available()
        elif engine == "lmstudio":
            return self._check_lmstudio_available()
        elif engine in ("openai", "anthropic"):
            return self._check_external_api_available(engine)
        return False

    def _check_pixelbrain_available(self) -> bool:
        """Check if PixelBrain is ready."""
        try:
            from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
            service = get_pixel_brain_service(brain_path=self.pixelbrain_path)
            return service.is_available()
        except Exception as e:
            logger.debug(f"PixelBrain not available: {e}")
            return False

    def _check_lmstudio_available(self) -> bool:
        """Check if LM Studio is running."""
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(1)
            result = sock.connect_ex(('localhost', 1234))
            sock.close()
            return result == 0
        except Exception:
            return False

    def _check_external_api_available(self, engine: str) -> bool:
        """Check if external API key is configured."""
        key_name = f"{engine.upper()}_API_KEY"
        return bool(os.environ.get(key_name))

    def get_engine(self, engine_name: Optional[str] = None) -> Any:
        """
        Get the cognitive engine backend.

        Args:
            engine_name: Specific engine to use, or None for default

        Returns:
            Backend object with generate() method
        """
        name = engine_name or self.default_engine

        # Check cache
        if name in self._backends:
            return self._backends[name]

        # Get or create backend
        backend = self._create_backend(name)
        self._backends[name] = backend
        return backend

    def _create_backend(self, name: str) -> Any:
        """Create a backend instance."""
        if name == "pixelbrain":
            from systems.swarm.llm_backend import get_swarm_llm_backend
            return get_swarm_llm_backend()
        elif name == "lmstudio":
            from systems.pixel_llm.lm_studio_integration import LMStudioClient
            return LMStudioClient()
        else:
            raise ValueError(f"Unknown cognitive engine: {name}")

    def get_available_engine(self) -> Optional[Any]:
        """
        Get the first available engine, trying default then fallbacks.

        Returns:
            Available backend or None
        """
        # Try default first
        if self.is_available(self.default_engine):
            return self.get_engine(self.default_engine)

        # Try fallback
        if self.is_available(self.fallback_engine):
            logger.info(f"Using fallback engine: {self.fallback_engine}")
            return self.get_engine(self.fallback_engine)

        # Try all engines
        for engine in CognitiveEngine:
            if self.is_available(engine.value):
                logger.info(f"Using available engine: {engine.value}")
                return self.get_engine(engine.value)

        logger.error("No cognitive engines available")
        return None


# Singleton
_config_instance: Optional[CognitiveConfig] = None


def get_cognitive_config(**kwargs) -> CognitiveConfig:
    """Get global CognitiveConfig singleton."""
    global _config_instance
    if _config_instance is None:
        _config_instance = CognitiveConfig(**kwargs)
    return _config_instance


def reset_cognitive_config():
    """Reset singleton (for testing)."""
    global _config_instance
    _config_instance = None
