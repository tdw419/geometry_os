#!/usr/bin/env python3
"""
Batch Analyzer for Scripture Truth Analyzer.
Processes 100 Genesis verses using CTRM Triad methodology.
Integrates with WordPress Semantic District for result publishing.
"""

import json
import os
import time
from typing import Dict, List, Any, Optional
from datetime import datetime

# Ensure we can import from the intelligence directory
import sys
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

# Import using absolute names relative to systems/intelligence
from scripture_truth_analyzer import ScriptureTruthAnalyzer, VerseCategory
from verse_classifier import VerseClassifier
from evidence_scorer import EvidenceScorer
from ctrm_triad import CTRMAnalyzer
from truth_texture import TruthTextureEncoder

# WordPress Semantic District integration (lazy import to handle missing dependencies)
WORDPRESS_AVAILABLE = None  # Will be determined on first use

def _get_wordpress_publisher():
    """
    Lazily import and return the WordPress publisher function.
    Returns None if dependencies are not available.
    """
    global WORDPRESS_AVAILABLE

    if WORDPRESS_AVAILABLE is not None:
        return publish_to_wordpress if WORDPRESS_AVAILABLE else None

    try:
        # Find wordpress_zone relative to this file or project root
        _this_dir = os.path.dirname(os.path.abspath(__file__))
        _project_root = os.path.dirname(os.path.dirname(_this_dir))
        _wp_zone_path = os.path.join(_project_root, "wordpress_zone")

        if _wp_zone_path not in sys.path and os.path.exists(_wp_zone_path):
            sys.path.insert(0, _wp_zone_path)

        from publish_to_wp import publish_to_wordpress as _publisher
        WORDPRESS_AVAILABLE = True
        return _publisher
    except (ImportError, ModuleNotFoundError):
        WORDPRESS_AVAILABLE = False
        return None

publish_to_wordpress = None  # Will be resolved lazily

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

        return {
            "verses_processed": len(verses),
            "report_path": self.output_path,
            "texture_path": texture_path,
            "results": self.analyzer.results
        }

    def publish_results_to_wordpress(self, pilot_results: Optional[Dict] = None) -> bool:
        """
        Publish CTRM analysis results to WordPress Semantic District.

        Creates a formatted post with:
        - CTRM statistical metrics (Cronbach α, Pearson r₁)
        - Category distribution
        - Link to truth manifold texture

        Args:
            pilot_results: Results dict from run_pilot(), or None to use cached results

        Returns:
            True if published successfully, False otherwise
        """
        publisher = _get_wordpress_publisher()
        if publisher is None:
            print("⚠️ Cannot publish: WordPress integration not available (missing dependencies)")
            print("   Hint: Install websocket-client with: pip install websocket-client")
            return False

        results = pilot_results.get("results", []) if pilot_results else self.analyzer.results
        if not results:
            print("⚠️ Cannot publish: No results available")
            return False

        # Calculate statistics
        total_verses = len(results)

        # Get CTRM metrics
        triad_scores = []
        category_counts = {}

        for r in results:
            triad = r.get("ctrm_evaluation", {}).get("triad_scores", {})
            if triad:
                triad_scores.append(triad)

            cat = r.get("category", "unknown")
            category_counts[cat] = category_counts.get(cat, 0) + 1

        # Calculate Cronbach α and Pearson r₁
        if len(triad_scores) >= 3:
            e1_scores = [t.get("E1_archaeology", 0.5) for t in triad_scores]
            e2_scores = [t.get("E2_manuscript", 0.5) for t in triad_scores]
            e3_scores = [t.get("E3_prophecy", 0.5) for t in triad_scores]

            alpha = CTRMAnalyzer.calculate_cronbach_alpha(e1_scores, e2_scores, e3_scores)
            r1 = CTRMAnalyzer.calculate_pearson_r1(e1_scores, e2_scores, e3_scores)
        else:
            alpha = 0.0
            r1 = 0.0

        # Calculate average confidence
        avg_confidence = sum(r.get("ctrm_evaluation", {}).get("confidence", 0) for r in results) / total_verses if total_verses > 0 else 0

        # Build category breakdown HTML
        category_html = "<ul>"
        for cat, count in sorted(category_counts.items(), key=lambda x: -x[1]):
            pct = (count / total_verses * 100) if total_verses > 0 else 0
            category_html += f"<li><b>{cat.title()}</b>: {count} verses ({pct:.1f}%)</li>"
        category_html += "</ul>"

        # Build WordPress post content
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        title = f"Genesis Pilot Batch: {total_verses} Verses Analyzed"

        content = f"""
        <h2>CTRM Truth Analysis Report</h2>
        <p><em>Generated: {timestamp}</em></p>

        <h3>📊 Statistical Metrics</h3>
        <table border="1" cellpadding="8" cellspacing="0">
            <tr><th>Metric</th><th>Value</th><th>Target</th><th>Status</th></tr>
            <tr>
                <td><b>Cronbach α</b></td>
                <td>{alpha:.4f}</td>
                <td>&lt; 0.5</td>
                <td>{"✅ PASS" if alpha < 0.5 else "⚠️ HIGH"}</td>
            </tr>
            <tr>
                <td><b>Pearson r₁</b></td>
                <td>{r1:.4f}</td>
                <td>&gt; 0.7</td>
                <td>{"✅ PASS" if r1 > 0.7 else "⚠️ BELOW (expected in mock mode)"}</td>
            </tr>
            <tr>
                <td><b>Avg Confidence</b></td>
                <td>{avg_confidence:.4f}</td>
                <td>N/A</td>
                <td>—</td>
            </tr>
        </table>

        <h3>📚 Category Distribution</h3>
        {category_html}

        <h3>🖼️ Truth Manifold</h3>
        <p>A 10x10 RGBA texture has been generated encoding the triad scores:</p>
        <ul>
            <li><b>Red channel</b>: E1 (Archaeological evidence)</li>
            <li><b>Green channel</b>: E2 (Manuscript reliability)</li>
            <li><b>Blue channel</b>: E3 (Prophetic coherence)</li>
            <li><b>Alpha channel</b>: Final confidence score</li>
        </ul>

        <h3>📖 Methodology</h3>
        <p>Analysis performed using the <b>Contextual Triad Rating Method (CTRM)</b> with:</p>
        <ul>
            <li>64-bit Hilbert-indexed BibleID for spatial mapping</li>
            <li>Three independent evidentiary frames (E1, E2, E3)</li>
            <li>Cronbach's α for elemental independence verification</li>
            <li>Pearson correlation for configurational stability</li>
        </ul>

        <p><em>"The Screen is the Hard Drive. The Website is the Memory."</em></p>
        """

        # Publish to WordPress
        print(f"\n📝 Publishing to WordPress Semantic District...")
        result = publisher(title, content, post_type="post")

        if result:
            print(f"✅ Results published to WordPress!")
            print(f"   Post ID: {result.get('post_id')}")
            print(f"   URL: {result.get('url')}")
            return True
        else:
            print(f"❌ Failed to publish to WordPress")
            return False

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Genesis Pilot Batch CTRM Analyzer")
    parser.add_argument("--max-verses", type=int, default=100, help="Maximum verses to analyze")
    parser.add_argument("--publish", action="store_true", help="Publish results to WordPress")
    parser.add_argument("--data-path", type=str, default=None, help="Path to genesis_kjv.json")
    parser.add_argument("--output-path", type=str, default=None, help="Path for output report")
    args = parser.parse_args()

    # Get absolute path to this script's directory to resolve data files correctly
    base_dir = os.path.dirname(os.path.abspath(__file__))

    if args.data_path:
        data_file = args.data_path
    else:
        data_file = os.path.join(base_dir, "data", "genesis_kjv.json")

    if args.output_path:
        output_file = args.output_path
    else:
        output_file = os.path.join(os.getcwd(), "genesis_pilot_report.json")

    runner = BatchAnalyzer(data_file, output_file)
    results = runner.run_pilot(args.max_verses)

    # Publish to WordPress if requested
    if args.publish and results:
        runner.publish_results_to_wordpress(results)
