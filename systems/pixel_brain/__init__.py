"""
PixelBrain - Live LLM inference bridge for tectonic agents.

This module provides real-time LLM-backed decision making for tectonic
negotiation, connecting agents to LM Studio for intelligent bidding,
counter-bid decisions, and district management.

Key Components:
- PixelBrainBridge: Main bridge connecting tectonic agents to LM Studio
- AsyncInferenceClient: Async client with rate limiting and caching
- Prompt templates for tectonic decisions
"""

from systems.pixel_brain.inference_bridge import PixelBrainBridge
from systems.pixel_brain.async_inference import AsyncInferenceClient
from systems.pixel_brain.prompts import (
    CLAIM_ANALYSIS_PROMPT,
    COUNTER_BID_PROMPT,
    DISTRICT_PURPOSE_PROMPT,
    DISTRICT_NAMING_PROMPT,
)

__all__ = [
    "PixelBrainBridge",
    "AsyncInferenceClient",
    "CLAIM_ANALYSIS_PROMPT",
    "COUNTER_BID_PROMPT",
    "DISTRICT_PURPOSE_PROMPT",
    "DISTRICT_NAMING_PROMPT",
]
