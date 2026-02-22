"""
WordPress Content Analyzer for Evolution Daemon.

Analyzes WordPress posts and proposes improvements.
"""

import re
from dataclasses import dataclass, field
from typing import Optional, List, Dict, Any

from .llm_expansion_service import LLMExpansionService, LLMExpansionConfig


@dataclass
class ContentAnalysis:
    """Analysis result for a WordPress post."""
    post_id: int
    title: str
    word_count: int
    readability_score: float
    issues: List[str] = field(default_factory=list)
    strengths: List[str] = field(default_factory=list)


@dataclass
class ImprovementProposal:
    """Proposed improvement for a WordPress post."""
    post_id: int
    improvement_type: str  # "expand", "enhance", "correct"
    suggested_content: str
    confidence: float
    reason: str
    target_selector: str = ""  # CSS selector for Playwright


class WordPressContentAnalyzer:
    """Analyzes WordPress posts and proposes improvements."""

    MIN_WORD_COUNT = 50
    MIN_TITLE_LENGTH = 5

    def __init__(
        self,
        llm_enabled: bool = False,
        llm_config: Optional[LLMExpansionConfig] = None
    ):
        """
        Initialize the analyzer.

        Args:
            llm_enabled: Enable LLM-powered content expansion (default: False)
            llm_config: Optional LLM configuration
        """
        self._llm_enabled = llm_enabled
        self._llm_config = llm_config
        self._llm_service = None

    @property
    def llm_service(self) -> LLMExpansionService:
        """Lazy-loaded LLM expansion service."""
        if self._llm_service is None:
            config = self._llm_config or LLMExpansionConfig(llm_enabled=self._llm_enabled)
            # Ensure llm_enabled is set correctly
            config.llm_enabled = self._llm_enabled
            self._llm_service = LLMExpansionService(config)
        return self._llm_service

    def analyze(self, post: Dict[str, Any]) -> Optional[ContentAnalysis]:
        """Analyze a WordPress post."""
        content = post.get("content", "")
        title = post.get("title", "")

        if not content and not title:
            return None

        # Calculate metrics
        words = self._extract_words(content)
        word_count = len(words)
        readability = self._calculate_readability(content)

        # Identify issues
        issues = []
        strengths = []

        if word_count < self.MIN_WORD_COUNT:
            issues.append(f"Content too short ({word_count} words)")

        if len(title) < self.MIN_TITLE_LENGTH:
            issues.append(f"Title too short ({len(title)} chars)")
        else:
            strengths.append("Descriptive title")

        if readability < 0.5:
            issues.append(f"Low readability ({readability:.2f})")
        elif readability > 0.7:
            strengths.append(f"Good readability ({readability:.2f})")

        return ContentAnalysis(
            post_id=post.get("id", 0),
            title=title,
            word_count=word_count,
            readability_score=readability,
            issues=issues,
            strengths=strengths
        )

    def propose_improvement(self, post: Dict[str, Any]) -> Optional[ImprovementProposal]:
        """Propose an improvement for a post."""
        analysis = self.analyze(post)
        if not analysis:
            return None

        # Determine improvement type based on analysis
        if analysis.word_count < self.MIN_WORD_COUNT:
            improvement_type = "expand"
            suggested = self._generate_expansion(post)
            reason = f"Content needs expansion ({analysis.word_count} words)"
        elif analysis.readability_score < 0.5:
            improvement_type = "enhance"
            suggested = self._generate_enhancement(post)
            reason = f"Readability needs improvement ({analysis.readability_score:.2f})"
        else:
            improvement_type = "correct"
            suggested = post.get("content", "")
            reason = "Minor corrections suggested"

        confidence = self._calculate_confidence(analysis)

        return ImprovementProposal(
            post_id=post.get("id", 0),
            improvement_type=improvement_type,
            suggested_content=suggested,
            confidence=confidence,
            reason=reason,
            target_selector=f"[data-post-id='{post.get('id')}']"
        )

    def _extract_words(self, text: str) -> List[str]:
        """Extract words from text, ignoring HTML."""
        # Strip HTML tags
        clean = re.sub(r'<[^>]+>', ' ', text)
        return clean.split()

    def _calculate_readability(self, text: str) -> float:
        """Calculate a simple readability score (0-1)."""
        words = self._extract_words(text)
        if not words:
            return 0.0

        # Simple heuristic: average word length and sentence count
        avg_word_len = sum(len(w) for w in words) / len(words)
        sentence_count = len(re.findall(r'[.!?]', text)) or 1

        # Normalize: prefer 4-6 char words, 15-20 words per sentence
        word_score = 1.0 - abs(avg_word_len - 5) / 10
        words_per_sentence = len(words) / sentence_count
        sentence_score = 1.0 - abs(words_per_sentence - 17) / 30

        return max(0.0, min(1.0, (word_score + sentence_score) / 2))

    def _generate_expansion(self, post: Dict[str, Any]) -> str:
        """Generate expanded content.

        Routes to LLM service when llm_enabled=True, otherwise uses template.
        """
        content = post.get("content", "")
        title = post.get("title", "")
        post_id = post.get("id", 0)

        # Use LLM service when enabled
        if self._llm_enabled:
            result = self.llm_service.expand(
                post_id=post_id,
                title=title,
                content=content
            )
            return result.content

        # Fallback: Simple expansion template
        expansion = f"""{content}

## Additional Context

This post about "{title}" covers important topics in the Geometry OS ecosystem.
Further exploration of these concepts can enhance understanding of the system.

### Key Points
- The concepts discussed relate to spatial computing
- Integration with the infinite map provides unique perspectives
- Evolution and self-improvement are core principles
"""
        return expansion.strip()

    def _generate_enhancement(self, post: Dict[str, Any]) -> str:
        """Generate enhanced content with better structure."""
        content = post.get("content", "")
        title = post.get("title", "")

        # Add structure to improve readability
        enhanced = f"""# {title}

{content}

---

*This content is part of the Geometry OS knowledge base.*
"""
        return enhanced.strip()

    def _calculate_confidence(self, analysis: ContentAnalysis) -> float:
        """Calculate confidence score for a proposal."""
        # More issues = higher confidence that improvement is needed
        issue_weight = len(analysis.issues) * 0.2

        # But if no issues, low confidence
        if not analysis.issues:
            return 0.1

        return min(0.95, 0.5 + issue_weight)
