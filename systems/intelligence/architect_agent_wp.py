#!/usr/bin/env python3
"""
🧠 ARCHITECT AGENT (GEOMETRY OS)
================================

This agent is responsible for the 'Self-Discovery' and 'Semantic Indexing' 
of the OS architecture. It crawls the systems/ directory and maintains 
the living 'Neural Substrate Map' in WordPress.

"The Website is the Memory. The Agent is the Weaver."
"""

import os
import sys
import json
import requests
import datetime
from pathlib import Path
from collections import Counter

# Add project root to path
sys.path.insert(0, os.getcwd())

class ArchitectAgent:
    def __init__(self, wp_url="http://localhost:8080"):
        self.wp_api = f"{wp_url}/?rest_route=/geometry-os/v1/invoke"
        self.systems_root = Path("systems")
        self.substrate_map_slug = "neural-substrate-architecture"

    def crawl_substrate(self):
        """
        Recursively walks through systems/ and identifies active modules.
        """
        print(f"🔍 Architect Agent: Crawling Substrate Root: {self.systems_root}...")
        
        components = []
        
        # Level 1 scan: Core Modules
        if not self.systems_root.exists():
            print(f"⚠️ systems/ root not found!")
            return []

        for module_dir in self.systems_root.iterdir():
            if module_dir.is_dir():
                component = self.analyze_module(module_dir)
                if component:
                    components.append(component)
        
        return components

    def analyze_module(self, module_path: Path):
        """
        Analyzes a single module to extract semantic purpose.
        """
        module_name = module_path.name
        
        # Skip hidden or environment dirs
        if module_name.startswith('.') or module_name == '__pycache__' or module_name == 'venv':
            return None

        print(f"🧪 Analyzing Module: {module_name}...")
        
        # 1. High-Level Topology
        all_files = list(module_path.rglob('*'))
        file_count = sum(1 for f in all_files if f.is_file())
        primary_lang = self._detect_primary_language(all_files)
        
        # 2. Full API Surface (Sampled)
        entry_points = self._find_entry_points(module_path)
        
        # 3. Semantic Enrichment
        description = self._generate_semantic_description(module_path)
        
        return {
            "component": module_name.replace('_', ' ').title(),
            "description": description,
            "path": str(module_path),
            "status": "active",
            "metadata": {
                "files": file_count,
                "language": primary_lang,
                "entry_points": entry_points
            }
        }

    def _detect_primary_language(self, all_files):
        extensions = [f.suffix for f in all_files if f.is_file()]
        if not extensions: return "unknown"
        return Counter(extensions).most_common(1)[0][0].replace('.', '').upper()

    def _find_entry_points(self, path: Path):
        potential = ['main.rs', 'app.rs', 'index.js', 'main.py', '__init__.py', 'visual_bridge.py']
        found = [f.name for f in path.rglob('*') if f.name in potential]
        return list(set(found))[:3]

    def _generate_semantic_description(self, path: Path):
        """
        Extract README or generate a fallback.
        """
        readme_path = path / "README.md"
        if readme_path.exists():
            try:
                with open(readme_path, 'r') as f:
                    content = f.read(200).replace('\n', ' ').strip()
                    return f"{content}..."
            except:
                pass
        
        # Fallback to smart naming
        name = path.name.replace('_', ' ')
        return f"Core {name} module responsible for the '{name}' layer of the Neural Substrate."

    def publish_map(self, components):
        """
        Pushes the discovered components to WordPress via WebMCP.
        """
        print(f"📝 Architect Agent: Publishing Substrate Map ({len(components)} components)...")
        
        for comp in components:
            # Enrich description with metadata for WordPress table
            entry_points_str = ", ".join(comp['metadata']['entry_points']) if comp['metadata']['entry_points'] else "N/A"
            rich_desc = f"{comp['description']}<br><br><b>Stack:</b> {comp['metadata']['language']} | <b>Files:</b> {comp['metadata']['files']} | <b>Entry Points:</b> <code>{entry_points_str}</code>"
            
            payload = {
                "tool": "updateArchitecture",
                "arguments": {
                    "component": comp['component'],
                    "description": rich_desc,
                    "path": comp['path'],
                    "status": comp['status']
                }
            }
            
            try:
                response = requests.post(self.wp_api, json=payload, timeout=5)
                if response.status_code == 200:
                    print(f"✅ Published: {comp['component']}")
                else:
                    print(f"❌ Failed to publish {comp['component']}: {response.text}")
            except Exception as e:
                print(f"⚠️ Error publishing {comp['component']}: {e}")

    def export_cache(self, components):
        """
        Exports the substrate map to a local JSON cache for DirectiveAgent.
        Cache path: .geometry/substrate_map.json
        """
        cache_path = Path(".geometry/substrate_map.json")
        cache_path.parent.mkdir(parents=True, exist_ok=True)

        # Build cache with component names as keys
        cache_data = {}
        for comp in components:
            cache_data[comp['component']] = {
                "name": comp['component'],
                "path": comp['path'],
                "description": comp['description'],
                "language": comp['metadata']['language'],
                "files": comp['metadata']['files'],
                "entry_points": comp['metadata']['entry_points']
            }

        with open(cache_path, 'w') as f:
            json.dump(cache_data, f, indent=2)

        print(f"📦 Architect Agent: Exported substrate map cache ({len(components)} components) to {cache_path}")

    def run(self):
        components = self.crawl_substrate()
        if components:
            self.publish_map(components)
            self.export_cache(components)
        print("🏙️ Architect Agent: Mapping Cycle Complete.")

if __name__ == "__main__":
    agent = ArchitectAgent()
    agent.run()
