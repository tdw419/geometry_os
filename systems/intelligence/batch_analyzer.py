#!/usr/bin/env python3
"""
Batch Analyzer for Scripture Truth Analyzer.
Processes 100 Genesis verses using CTRM Triad methodology.
"""

import json
import os
import time
from typing import Dict, List, Any

# Ensure we can import from the intelligence directory
import sys
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

# Import using absolute names relative to systems/intelligence
from scripture_truth_analyzer import ScriptureTruthAnalyzer, VerseCategory
from verse_classifier import VerseClassifier
from evidence_scorer import EvidenceScorer
from ctrm_triad import CTRMAnalyzer
from truth_texture import TruthTextureEncoder

class BatchAnalyzer:
    """
    Orchestrates batch processing of Bible verses for CTRM analysis.
    """

    def __init__(self, data_path: str = "data/genesis_kjv.json",
                 output_path: str = "genesis_pilot_report.json"):
        self.data_path = data_path
        self.output_path = output_path
        self.analyzer = ScriptureTruthAnalyzer(output_path)

    def run_pilot(self, max_verses: int = 100):
        """
        Runs the Genesis pilot batch analysis.
        """
        print(f"🚀 STA: Starting Genesis Pilot (Max {max_verses} verses)...")
        
        with open(self.data_path, 'r') as f:
            data = json.load(f)
            
        verses = data.get("verses", [])[:max_verses]
        print(f"📄 STA: Loaded {len(verses)} verses from {data['book']} ({data['translation']})")
        
        for idx, v in enumerate(verses):
            ref = f"{data['book']} {v['chapter']}:{v['verse']}"
            text = v['text']
            
            # 1. Classify
            category = VerseClassifier.classify(text, v['chapter'])
            
            # 2. Score
            evidence = EvidenceScorer.get_mock_scores(text, category)
            
            # 3. Analyze (this performs truth scoring and spatial mapping)
            self.analyzer.analyze_verse(ref, text, category, evidence)
            
            if (idx + 1) % 10 == 0:
                print(f"   ✓ Processed {idx + 1}/{len(verses)} verses...")
                
        # 4. Save final report (this calls self.analyzer.save_report internally)
        self.analyzer.save_report()

        # 5. Generate truth manifold texture
        texture_path = os.path.join(os.getcwd(), "genesis_truth_manifold.rts.png")
        encoder = TruthTextureEncoder(size=10)
        encoder.save(self.analyzer.results, texture_path)
        print(f"   Truth manifold texture saved to {texture_path}")

        print(f"\n✅ STA: Pilot complete! Report saved to {self.output_path}")

if __name__ == "__main__":
    # Get absolute path to this script's directory to resolve data files correctly
    base_dir = os.path.dirname(os.path.abspath(__file__))
    data_file = os.path.join(base_dir, "data", "genesis_kjv.json")
    
    # Use project root for output report
    output_file = os.path.join(os.getcwd(), "genesis_pilot_report.json")
    
    runner = BatchAnalyzer(data_file, output_file)
    runner.run_pilot(100)
