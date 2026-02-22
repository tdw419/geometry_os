#!/usr/bin/env python3
"""
Evidence Scorer for Scripture Truth Analyzer.
Generates CTRM triad scores using heuristics (mock) or LLM analysis.
"""

import os
import sys
from typing import Dict, Any
import hashlib

# Ensure we can import from the intelligence directory
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from verse_classifier import VerseCategory

class EvidenceScorer:
    """
    Generates E1 (Archaeology), E2 (Manuscript), E3 (Prophecy) scores.
    """

    @classmethod
    def get_mock_scores(cls, text: str, category: VerseCategory) -> Dict[str, float]:
        """
        Heuristic-based scoring for Genesis pilot.
        """
        text_lower = text.lower()
        
        # E2 (Manuscript) is high for Genesis due to Dead Sea Scrolls (1QIsa etc)
        # and Masoretic stability.
        e2_manuscript = 0.95
        
        # E1 (Archaeology)
        # High for specific geographical sites or names confirmed in ANE records
        e1_archaeology = 0.2 # Baseline for Genesis (proto-history)
        
        # Site confirms (ANE parallels)
        if any(word in text_lower for word in ["euphrates", "hiddekel", "assyria", "ethiopia"]):
            e1_archaeology = 0.85 # Strong geographical anchors
        elif any(word in text_lower for word in ["eden", "havilah", "nod"]):
            e1_archaeology = 0.40 # Traditional but debated geography
        elif "city" in text_lower or "built" in text_lower:
            e1_archaeology = 0.50 # General urban development corroboration
            
        # E3 (Prophecy/Logical Coherence)
        e3_prophecy = 0.70 # Baseline coherence
        
        if category == VerseCategory.PROPHETIC:
            e3_prophecy = 0.90 # High internal consistency
        elif category == VerseCategory.COSMOLOGICAL:
            e3_prophecy = 0.50 # Philosophically stable but empirically remote
        elif category == VerseCategory.LAW:
            e3_prophecy = 0.85 # High legal/moral coherence
            
        # Add some deterministic jitter based on text hash to simulate real data variance
        jitter = (int(hashlib.md5(text.encode()).hexdigest(), 16) % 100) / 1000.0 - 0.05
        
        return {
            "archaeology": round(max(0.0, min(1.0, e1_archaeology + jitter)), 3),
            "manuscript": round(max(0.0, min(1.0, e2_manuscript + jitter)), 3),
            "prophecy": round(max(0.0, min(1.0, e3_prophecy + jitter)), 3)
        }

if __name__ == "__main__":
    from verse_classifier import VerseClassifier
    text = "And the name of the third river is Hiddekel: that is it which goeth toward the east of Assyria."
    cat = VerseClassifier.classify(text)
    print(f"Scores for '{text[:30]}...': {EvidenceScorer.get_mock_scores(text, cat)}")
