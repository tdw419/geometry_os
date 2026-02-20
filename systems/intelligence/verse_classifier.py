#!/usr/bin/env python3
"""
Verse Classifier for Scripture Truth Analyzer.
Rules-based classification of Bible verses into CTRM categories.
"""

from enum import Enum
import re

class VerseCategory(Enum):
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
    """

    # Priority: PROPHETIC > LAW > POETIC > COSMOLOGICAL > HISTORICAL

    # Known prophetic references - checked before keyword matching
    PROPHETIC_REFERENCES = {
        ("Genesis", 3, 15),
        ("Genesis", 12, 3),
        ("Genesis", 22, 18),
        ("Genesis", 28, 14),
        ("Genesis", 49, 10),
    }

    RULES = [
        (VerseCategory.PROPHETIC, r"\b(prophesied|prophecy|behold|saith the lord|it shall come to pass|vision|dreamed|seed|bruise|heel)\b"),
        (VerseCategory.LAW, r"\b(commanded|statute|ordinance|thou shalt|shalt not|curse|cursed|law|judgments)\b"),
        (VerseCategory.POETIC, r"\b(blessed|blessing|song|praise|sing|mercy|shepherd|fruitful|multiply|replenish)\b"),
        (VerseCategory.COSMOLOGICAL, r"\b(beginning|created|heaven|earth|firmament|light|darkness|day|night|waters|seas|void|form)\b"),
        (VerseCategory.HISTORICAL, r"\b(begat|son of|lived|years|died|journeyed|dwelt|built|called|name)\b")
    ]

    @classmethod
    def classify(cls, text: str, chapter: int = 1, book: str = "Genesis", verse: int = 0) -> VerseCategory:
        # Check prophetic reference lookup table FIRST
        if (book, chapter, verse) in cls.PROPHETIC_REFERENCES:
            return VerseCategory.PROPHETIC

        text_lower = text.lower()

        # Special case: Genesis 1 is predominantly cosmological
        if chapter == 1:
            if re.search(r"\b(created|beginning|firmament|waters)\b", text_lower):
                return VerseCategory.COSMOLOGICAL

        for category, pattern in cls.RULES:
            if re.search(pattern, text_lower):
                return category

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
