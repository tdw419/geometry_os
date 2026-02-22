"""
LLM-Powered Expansion Service for WordPress Evolution Daemon.

Replaces template-based content expansion with intelligent LLM-generated
improvements using ZAI Bridge.
"""

import asyncio
import logging
import re
import sys
from dataclasses import dataclass, field
from typing import Optional, Dict, Any, List

# Add root to path for zai_bridge import
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')

logger = logging.getLogger("llm_expansion_service")


@dataclass
class LLMExpansionConfig:
    """Configuration for LLM expansion service."""
    model: str = "glm-4-plus"
    temperature: float = 0.7
    timeout: int = 30
    max_tokens: int = 2048
    llm_enabled: bool = False  # Feature flag - disabled by default
    fallback_confidence: float = 0.3
    target_expansion_ratio: float = 2.0  # Target 2-3x original length


@dataclass
class ExpansionResult:
    """Result of content expansion."""
    post_id: int
    content: str
    confidence: float
    model_used: str
    fallback_used: bool = False
    error: Optional[str] = None
    original_length: int = 0
    expanded_length: int = 0
    expansion_ratio: float = 0.0


class LLMExpansionService:
    """
    LLM-powered content expansion service.

    Uses ZAI Bridge with "coder" persona for intelligent content generation.
    Falls back to template-based expansion when LLM is unavailable or fails.
    """

    def __init__(self, config: Optional[LLMExpansionConfig] = None):
        """Initialize the service with lazy bridge loading."""
        self.config = config or LLMExpansionConfig()
        self._bridge = None
        self._bridge_loaded = False

    def _get_bridge(self):
        """Lazy load ZAIBridge to avoid import errors if not needed."""
        if not self._bridge_loaded:
            try:
                from zai_bridge import ZAIBridge
                self._bridge = ZAIBridge(default_model=self.config.model)
                self._bridge_loaded = True
                logger.info("ZAIBridge loaded successfully")
            except ImportError as e:
                logger.warning(f"ZAIBridge not available: {e}")
                self._bridge = None
                self._bridge_loaded = True
        return self._bridge

    def expand(
        self,
        post_id: int,
        title: str,
        content: str,
        context: Optional[str] = None
    ) -> ExpansionResult:
        """
        Expand content using LLM or fallback template.

        Args:
            post_id: WordPress post ID
            title: Post title
            content: Original post content
            context: Optional additional context for expansion

        Returns:
            ExpansionResult with expanded content and metadata
        """
        original_length = len(self._extract_text(content))

        # Try LLM expansion if enabled
        if self.config.llm_enabled:
            try:
                result = self._expand_with_llm(post_id, title, content, context)
                if result and not result.fallback_used:
                    return result
                logger.info("LLM expansion failed, using fallback")
            except Exception as e:
                logger.error(f"LLM expansion error: {e}")

        # Fallback to template-based expansion
        return self._fallback_expansion(post_id, title, content, original_length)

    def _expand_with_llm(
        self,
        post_id: int,
        title: str,
        content: str,
        context: Optional[str] = None
    ) -> Optional[ExpansionResult]:
        """Attempt expansion using ZAI Bridge."""
        bridge = self._get_bridge()
        if not bridge:
            return None

        original_text = self._extract_text(content)
        original_length = len(original_text)

        # Build prompt for LLM
        prompt = self._build_expansion_prompt(title, content, context)

        try:
            # Use asyncio.run() for sync wrapper (ZAIBridge.chat is async)
            expanded = asyncio.run(
                bridge.chat(
                    "coder",
                    prompt,
                    model=self.config.model,
                )
            )

            if not expanded or expanded.startswith("[Mock"):
                # Mock response or empty - use fallback
                return None

            expanded_length = len(self._extract_text(expanded))
            confidence = self._calculate_confidence(
                original_length,
                expanded_length,
                expanded
            )

            return ExpansionResult(
                post_id=post_id,
                content=expanded.strip(),
                confidence=confidence,
                model_used=self.config.model,
                fallback_used=False,
                original_length=original_length,
                expanded_length=expanded_length,
                expansion_ratio=expanded_length / max(original_length, 1)
            )

        except Exception as e:
            logger.error(f"LLM call failed: {e}")
            return None

    def _build_expansion_prompt(
        self,
        title: str,
        content: str,
        context: Optional[str] = None
    ) -> str:
        """Build the prompt for LLM expansion."""
        prompt = f"""Expand and enhance the following WordPress post content.

Title: {title}

Current Content:
{content}

Requirements:
1. Expand the content to be 2-3x longer than the original
2. Add relevant subsections with ## headings
3. Include bullet points for key information using -
4. Maintain the original tone and style
5. Add context and depth to the topic
6. Keep the content practical and useful
"""
        if context:
            prompt += f"\nAdditional Context:\n{context}\n"

        prompt += "\nReturn only the expanded content, ready for WordPress."

        return prompt

    def _fallback_expansion(
        self,
        post_id: int,
        title: str,
        content: str,
        original_length: int
    ) -> ExpansionResult:
        """Generate template-based fallback expansion."""
        # Simple expansion template (same as original ContentAnalyzer)
        expansion = f"""{content}

## Additional Context

This post about "{title}" covers important topics in the Geometry OS ecosystem.
Further exploration of these concepts can enhance understanding of the system.

### Key Points
- The concepts discussed relate to spatial computing
- Integration with the infinite map provides unique perspectives
- Evolution and self-improvement are core principles
"""
        expanded_content = expansion.strip()
        expanded_length = len(self._extract_text(expanded_content))

        return ExpansionResult(
            post_id=post_id,
            content=expanded_content,
            confidence=self.config.fallback_confidence,
            model_used="template",
            fallback_used=True,
            original_length=original_length,
            expanded_length=expanded_length,
            expansion_ratio=expanded_length / max(original_length, 1)
        )

    def _calculate_confidence(
        self,
        original_length: int,
        expanded_length: int,
        expanded_content: str
    ) -> float:
        """
        Calculate confidence score for LLM expansion.

        Base: 0.5 for LLM
        + Length ratio bonus (2-3x target): up to 0.3
        + Structure bonus (headings, bullets): up to 0.2
        """
        # Base confidence for LLM
        confidence = 0.5

        # Length ratio bonus
        if original_length > 0:
            ratio = expanded_length / original_length
            if 2.0 <= ratio <= 3.0:
                confidence += 0.3  # Perfect ratio
            elif 1.5 <= ratio <= 4.0:
                confidence += 0.15  # Acceptable ratio
            # else: no bonus for poor ratio

        # Structure bonus
        structure_bonus = 0.0

        # Check for headings (## or ###)
        heading_count = len(re.findall(r'^#{2,3}\s+\S+', expanded_content, re.MULTILINE))
        if heading_count >= 2:
            structure_bonus += 0.1

        # Check for bullet points (- or *)
        bullet_count = len(re.findall(r'^\s*[-*]\s+\S+', expanded_content, re.MULTILINE))
        if bullet_count >= 3:
            structure_bonus += 0.1

        confidence += structure_bonus

        # Cap at 0.95
        return min(0.95, confidence)

    def _extract_text(self, html_content: str) -> str:
        """Extract plain text from HTML content."""
        # Strip HTML tags
        clean = re.sub(r'<[^>]+>', ' ', html_content)
        # Normalize whitespace
        clean = re.sub(r'\s+', ' ', clean)
        return clean.strip()


# Convenience function for quick testing
def create_service(llm_enabled: bool = False) -> LLMExpansionService:
    """Create an LLMExpansionService with specified settings."""
    config = LLMExpansionConfig(llm_enabled=llm_enabled)
    return LLMExpansionService(config)


if __name__ == "__main__":
    # Quick test
    service = create_service(llm_enabled=False)
    result = service.expand(
        post_id=1,
        title="Test Post",
        content="This is a short test post."
    )
    print(f"Confidence: {result.confidence}")
    print(f"Fallback used: {result.fallback_used}")
    print(f"Content length: {len(result.content)}")
