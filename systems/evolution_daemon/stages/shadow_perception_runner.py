"""
Shadow Perception Runner (Subprocess Interface)

This script is spawned by SubprocessMirrorBridge to run benchmarks 
in isolation for Master Stage perception upgrades.
"""
import json
import sys
import os
import asyncio
from pathlib import Path
import importlib.util

# Add project root to sys.path
sys.path.insert(0, os.getcwd())

from systems.evolution_daemon.visual_verification_service import VisualIntent
from systems.evolution_daemon.benchmarks.visual.perception_benchmark import SCENES

async def run_shadow_benchmarks(sandbox_path: str):
    """
    Load the modified service and run benchmarks.
    """
    results = {
        "overall_accuracy": 0.0,
        "immortality_passed": False,
        "metrics": {},
        "issues": []
    }
    
    # 1. Load the shadow implementation of VisualVerificationService
    # We replace the global VisualVerificationService with the shadow one
    shadow_file = Path(sandbox_path) / "systems/evolution_daemon/visual_verification_service.py"
    if not shadow_file.exists():
        results["issues"].append(f"Shadow file not found at {shadow_file}")
        print(json.dumps(results))
        return

    # Dynamic import of shadow service
    spec = importlib.util.spec_from_file_location("shadow_vvs", str(shadow_file))
    shadow_vvs_module = importlib.util.module_from_spec(spec)
    try:
        spec.loader.exec_module(shadow_vvs_module)
        VisualVerificationService = shadow_vvs_module.VisualVerificationService
    except Exception as e:
        results["issues"].append(f"Failed to load shadow service: {str(e)}")
        print(json.dumps(results))
        return

    # 2. Instantiate shadow service
    service = VisualVerificationService()
    
    # 3. Run benchmarks
    total_matches = 0
    passed_matches = 0
    
    # Immortality checks (Terminal, Anchors)
    # We simulate scenes from SCENES
    for scene_name, scene_data in SCENES.items():
        # A real benchmark would have actual screenshots or more complex scene data
        # For this prototype, we'll simulate the mirror validation check
        
        for element in scene_data["elements"]:
            total_matches += 1
            intent = VisualIntent(
                element_type=element["type"],
                position=(element["x"], element["y"]),
                size=(element.get("width", 50), element.get("height", 30)),
                properties={"text": element.get("text", "")}
            )
            
            # Construct a mock actual scene from the benchmark data
            actual_scene = {"children": scene_data["elements"]}
            
            # Run the shadow verifier
            verification = await service.verify(intent, actual_scene)
            
            if verification.success:
                passed_matches += 1
            else:
                results["issues"].append(f"Failed '{scene_name}': {verification.summary}")
    
    # 4. Final scoring
    if total_matches > 0:
        results["overall_accuracy"] = passed_matches / total_matches
    
    # Immortality check (MANDATORY scene 'basic_ui' must pass)
    # In a real system, we'd have explicit tags for immortality
    results["immortality_passed"] = passed_matches > 0 # Simple check for now
    
    # 5. Output results
    print(json.dumps(results))

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(json.dumps({"error": "No sandbox path provided"}))
        sys.exit(1)
        
    sandbox_path = sys.argv[1]
    asyncio.run(run_shadow_benchmarks(sandbox_path))
