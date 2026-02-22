#!/usr/bin/env python3
"""
Vision Model Client

Interfaces with vision-language models for PixelRTS analysis.
Supports LM Studio, OpenAI, and Anthropic APIs.
"""

import os
from enum import Enum
from typing import Dict, Any, Optional, List
import requests


class ModelProvider(Enum):
    """Supported vision model providers."""
    LM_STUDIO = "lm_studio"
    OPENAI = "openai"
    ANTHROPIC = "anthropic"


class VisionModelClient:
    """Client for vision model API interactions."""

    # Default endpoints
    DEFAULT_ENDPOINTS = {
        ModelProvider.LM_STUDIO: "http://localhost:1234/v1",
        ModelProvider.OPENAI: "https://api.openai.com/v1",
        ModelProvider.ANTHROPIC: "https://api.anthropic.com/v1"
    }

    # Model names
    DEFAULT_MODELS = {
        ModelProvider.LM_STUDIO: "local-model",  # Auto-detected by LM Studio
        ModelProvider.OPENAI: "gpt-4-vision-preview",
        ModelProvider.ANTHROPIC: "claude-3-opus-20240229"
    }

    def __init__(
        self,
        provider: ModelProvider = ModelProvider.LM_STUDIO,
        endpoint: Optional[str] = None,
        api_key: Optional[str] = None,
        model: Optional[str] = None
    ):
        """Initialize vision model client.

        Args:
            provider: Model provider to use
            endpoint: Override default endpoint URL
            api_key: API key (for OpenAI/Anthropic)
            model: Override default model name
        """
        self.provider = provider
        # Support both 'endpoint' and 'base_url' for compatibility
        self.endpoint = endpoint or self.DEFAULT_ENDPOINTS[provider]
        self.base_url = self.endpoint  # Keep for backwards compatibility
        self.api_key = api_key or os.getenv(f"{provider.value.upper()}_API_KEY")
        self.model = model or self.DEFAULT_MODELS[provider]

    def build_analysis_prompt(
        self,
        artifact_type: str,
        metadata: Dict[str, Any]
    ) -> str:
        """Build structured prompt for vision analysis.

        Args:
            artifact_type: Type of artifact (kernel, initrd, wasm, etc.)
            metadata: PixelRTS metadata dictionary

        Returns:
            Structured prompt string
        """
        # Include all metadata in the prompt
        metadata_lines = []
        for key, value in metadata.items():
            metadata_lines.append(f"{key}: {value}")

        metadata_str = "\n".join(metadata_lines) if metadata_lines else "No metadata available"

        prompt = f"""Analyze this PixelRTS v2 visual artifact.

Artifact Type: {artifact_type}

Metadata:
{metadata_str}

Please identify:
1. Structural patterns (repeated blocks, sections, regions)
2. Entropy distribution (high/low complexity areas)
3. Anomalies (unexpected patterns, data artifacts)
4. Binary format characteristics (if recognizable)

Describe your findings in detail, referencing visual regions using
coordinates (top-left is 0,0).
"""
        return prompt

    def format_messages_with_image(
        self,
        prompt: str,
        image_base64: str,
        api_format: Optional[str] = None
    ) -> List[Dict[str, Any]]:
        """Format messages for vision API call.

        Args:
            prompt: Text prompt for the model
            image_base64: Base64-encoded PNG image
            api_format: Either "openai" or "anthropic" (auto-detect if None)

        Returns:
            Formatted messages list
        """
        # Auto-detect format if not specified
        if api_format is None:
            if self.provider == ModelProvider.ANTHROPIC:
                api_format = "anthropic"
            else:
                api_format = "openai"

        if api_format == "anthropic":
            return self._format_anthropic_messages(prompt, image_base64)
        else:
            return self._format_openai_messages(prompt, image_base64)

    def _format_openai_messages(
        self,
        prompt: str,
        image_base64: str
    ) -> List[Dict[str, Any]]:
        """Format messages for OpenAI-compatible API."""
        return [{
            "role": "user",
            "content": [
                {"type": "text", "text": prompt},
                {
                    "type": "image_url",
                    "image_url": {
                        "url": f"data:image/png;base64,{image_base64}"
                    }
                }
            ]
        }]

    def _format_anthropic_messages(
        self,
        prompt: str,
        image_base64: str
    ) -> List[Dict[str, Any]]:
        """Format messages for Anthropic API."""
        return [{
            "role": "user",
            "content": [
                {"type": "text", "text": prompt},
                {
                    "type": "image",
                    "source": {
                        "type": "base64",
                        "media_type": "image/png",
                        "data": image_base64
                    }
                }
            ]
        }]

    def analyze(
        self,
        prompt: str,
        image_base64: str,
        max_tokens: int = 2048
    ) -> Optional[str]:
        """Send analysis request to vision model.

        Args:
            prompt: Text prompt
            image_base64: Base64-encoded image
            max_tokens: Maximum tokens in response

        Returns:
            Model's text response, or None if failed
        """
        messages = self.format_messages_with_image(prompt, image_base64)

        if self.provider == ModelProvider.ANTHROPIC:
            return self._call_anthropic_api(messages, max_tokens)
        else:
            return self._call_openai_compatible_api(messages, max_tokens)

    def _call_openai_compatible_api(
        self,
        messages: List[Dict[str, Any]],
        max_tokens: int = 2048,
        image_b64: Optional[str] = None
    ) -> Optional[str]:
        """Call OpenAI-compatible API (LM Studio, OpenAI).

        Args:
            messages: Formatted messages list
            max_tokens: Maximum tokens in response (default 2048)
            image_b64: Optional base64 image (for compatibility, already in messages)

        Returns:
            Model's text response, or None if failed
        """
        url = f"{self.base_url}/chat/completions"

        headers = {"Content-Type": "application/json"}
        if self.api_key:
            headers["Authorization"] = f"Bearer {self.api_key}"

        payload = {
            "model": self.model,
            "messages": messages,
            "max_tokens": max_tokens
        }

        try:
            response = requests.post(url, json=payload, headers=headers, timeout=120)

            if response.status_code == 200:
                data = response.json()
                return data["choices"][0]["message"]["content"]
            else:
                print(f"API error {response.status_code}: {response.text}")
                return None
        except Exception as e:
            print(f"Request failed: {e}")
            return None

    def _call_anthropic_api(
        self,
        messages: List[Dict[str, Any]],
        max_tokens: int = 2048,
        image_b64: Optional[str] = None
    ) -> Optional[str]:
        """Call Anthropic Claude API.

        Args:
            messages: Formatted messages list
            max_tokens: Maximum tokens in response (default 2048)
            image_b64: Optional base64 image (for compatibility, already in messages)

        Returns:
            Model's text response, or None if failed
        """
        url = f"{self.base_url}/messages"

        headers = {
            "Content-Type": "application/json",
            "x-api-key": self.api_key,
            "anthropic-version": "2023-06-01"
        }

        payload = {
            "model": self.model,
            "messages": messages,
            "max_tokens": max_tokens
        }

        try:
            response = requests.post(url, json=payload, headers=headers, timeout=120)

            if response.status_code == 200:
                data = response.json()
                # Anthropic returns content as an array of blocks
                text_blocks = []
                for block in data.get("content", []):
                    # Handle both formats: with and without "type" field
                    if isinstance(block, dict):
                        if "text" in block:
                            text_blocks.append(block["text"])
                        elif block.get("type") == "text" and "text" in block:
                            text_blocks.append(block["text"])
                return "\n".join(text_blocks) if text_blocks else None
            else:
                print(f"API error {response.status_code}: {response.text}")
                return None
        except Exception as e:
            print(f"Request failed: {e}")
            return None
