#!/usr/bin/env python3
"""
Verse Classifier for Scripture Truth Analyzer.
Rules-based classification of Bible verses into CTRM categories.
"""

from enum import Enum
import re
import logging
from typing import Set, Tuple, List

logger = logging.getLogger(__name__)


class VerseCategory(Enum):
    """Enumeration of Bible verse categories used in CTRM analysis."""
    HISTORICAL = "historical"
    POETIC = "poetic"
    PROPHETIC = "prophetic"
    LAW = "law"
    EPISTLE = "epistle"
    COSMOLOGICAL = "cosmological"
    PARABLE = "parable"


class VerseClassifier:
    """
    Classifies Bible verses based on keyword patterns and linguistic markers.

    Classification Priority Order:
        1. **Prophetic Reference Lookup** - Known Messianic references are checked
           first to ensure they are always classified as PROPHETIC regardless
           of text content. Examples: Genesis 3:15 (seed of woman), 12:3, 22:18.
        2. **Special Case Rules** - Chapter-specific rules override keyword matching
           (e.g., Genesis 1 cosmological terms -> COSMOLOGICAL).
        3. **Keyword Pattern Matching** - Regex patterns applied in order:
           PROPHETIC > LAW > POETIC > COSMOLOGICAL > HISTORICAL
        4. **Default Fallback** - Returns HISTORICAL if no patterns match.

    Attributes:
        PROPHETIC_REFERENCES: Set of (book, chapter, verse) tuples for known
            prophetic/Messianic references.
        RULES: Ordered list of (category, regex_pattern) tuples for classification.
    """

    # Priority: PROPHETIC > LAW > POETIC > COSMOLOGICAL > HISTORICAL

    # Known prophetic references - checked before keyword matching
    PROPHETIC_REFERENCES: Set[Tuple[str, int, int]] = {
        ("Genesis", 3, 15),
        ("Genesis", 12, 3),
        ("Genesis", 22, 18),
        ("Genesis", 28, 14),
        ("Genesis", 49, 10),
    }

    RULES: List[Tuple[VerseCategory, str]] = [
        (VerseCategory.PROPHETIC, r"\b(prophesied|prophecy|behold|saith the lord|it shall come to pass|vision|dreamed|seed|bruise|heel)\b"),
        (VerseCategory.LAW, r"\b(commanded|statute|ordinance|thou shalt|shalt not|curse|cursed|law|judgments)\b"),
        (VerseCategory.POETIC, r"\b(blessed|blessing|song|praise|sing|mercy|shepherd|fruitful|multiply|replenish)\b"),
        (VerseCategory.COSMOLOGICAL, r"\b(beginning|created|heaven|earth|firmament|light|darkness|day|night|waters|seas|void|form)\b"),
        (VerseCategory.HISTORICAL, r"\b(begat|son of|lived|years|died|journeyed|dwelt|built|called|name)\b")
    ]

    @classmethod
    def classify(
        cls,
        text: str,
        chapter: int = 1,
        book: str = "Genesis",
        verse: int = 0,
        debug: bool = False
    ) -> VerseCategory:
        """
        Classify a Bible verse into a CTRM category.

        Classification follows a priority order to ensure consistent results:
        1. Prophetic reference lookup (known Messianic verses)
        2. Special case rules (chapter-specific patterns)
        3. Keyword pattern matching (in rule order)
        4. Default to HISTORICAL

        Args:
            text: The verse text to classify.
            chapter: Chapter number (default: 1 for backward compatibility).
            book: Book name (default: "Genesis" for backward compatibility).
            verse: Verse number (default: 0 for backward compatibility).
            debug: If True, log classification decisions for debugging.

        Returns:
            VerseCategory enum value indicating the classified category.

        Example:
            >>> VerseClassifier.classify("In the beginning God created...")
            <VerseCategory.COSMOLOGICAL: 'cosmological'>
            >>> VerseClassifier.classify("seed", chapter=3, verse=15)
            <VerseCategory.PROPHETIC: 'prophetic'>
        """
        # Check prophetic reference lookup table FIRST
        reference = (book, chapter, verse)
        if reference in cls.PROPHETIC_REFERENCES:
            if debug:
                logger.debug(
                    f"[VerseClassifier] {book} {chapter}:{verse} -> PROPHETIC "
                    f"(matched prophetic reference lookup)"
                )
            return VerseCategory.PROPHETIC

        text_lower = text.lower()

        # Special case: Genesis 1 is predominantly cosmological
        if chapter == 1:
            if re.search(r"\b(created|beginning|firmament|waters)\b", text_lower):
                if debug:
                    logger.debug(
                        f"[VerseClassifier] {book} {chapter}:{verse} -> COSMOLOGICAL "
                        f"(matched Genesis 1 special case)"
                    )
                return VerseCategory.COSMOLOGICAL

        # Apply keyword pattern rules in priority order
        for category, pattern in cls.RULES:
            if re.search(pattern, text_lower):
                if debug:
                    logger.debug(
                        f"[VerseClassifier] {book} {chapter}:{verse} -> {category.name} "
                        f"(matched pattern: {pattern[:30]}...)"
                    )
                return category

        # Default fallback
        if debug:
            logger.debug(
                f"[VerseClassifier] {book} {chapter}:{verse} -> HISTORICAL "
                f"(default fallback, no patterns matched)"
            )
        return VerseCategory.HISTORICAL

if __name__ == "__main__":
    # Test
    test_cases = [
        "In the beginning God created the heaven and the earth.",
        "And Adam lived an hundred and thirty years, and begat a son...",
        "I will put enmity between thee and the woman, and between thy seed and her seed...",
        "Cursed is the ground for thy sake; in sorrow shalt thou eat of it..."
    ]
    
    for t in test_cases:
        print(f"Text: {t[:50]}... -> Category: {VerseClassifier.classify(t).value}")
