#!/usr/bin/env python3
"""
GlyphStratum Performance Profiler

Measures execution time per glyph and identifies bottlenecks.
"""
import sys
import os
import time
import json
from typing import Dict, List, Any, Optional
from dataclasses import dataclass, field
from datetime import datetime
from collections import defaultdict

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "agent-harness", "cli_anything"))

from glyph_stratum.core.stratum import Stratum, Opcode, GlyphInfo, GlyphMetadata, ProvenanceInfo
from glyph_stratum.core.glyph_registry import GlyphRegistry
from glyph_stratum.core.executor import GlyphStratumExecutor


@dataclass
class GlyphProfile:
    """Performance profile for a single glyph."""
    glyph_id: int
    stratum: str
    opcode: str
    rationale: str
    execution_time_ms: float
    call_count: int = 1
    dependencies: List[int] = field(default_factory=list)
    is_bottleneck: bool = False
    hot_path: bool = False


@dataclass
class ExecutionTrace:
    """Single execution trace entry."""
    glyph_id: int
    start_time: float
    end_time: float
    result: Any = None
    error: Optional[str] = None


@dataclass
class ProfileReport:
    """Complete profiling report."""
    program_name: str
    total_glyphs: int
    total_time_ms: float
    avg_time_per_glyph_ms: float
    profiles: List[GlyphProfile]
    hot_path: List[int]
    bottlenecks: List[int]
    strata_breakdown: Dict[str, float]
    opcode_breakdown: Dict[str, float]
    coherence: float


class GlyphProfiler:
    """
    Profiler for GlyphStratum execution.

    Measures:
    - Per-glyph execution time
    - Hot paths (frequently executed glyphs)
    - Bottlenecks (slow glyphs)
    - Strata-level breakdown
    """

    def __init__(self, registry: GlyphRegistry, name: str = "program"):
        self.registry = registry
        self.name = name
        self.profiles: Dict[int, GlyphProfile] = {}
        self.traces: List[ExecutionTrace] = []
        self.execution_count: Dict[int, int] = defaultdict(int)

    def profile_execution(self, iterations: int = 1) -> ProfileReport:
        """
        Execute program and profile performance.

        Args:
            iterations: Number of times to run for averaging
        """
        # Reset profiles
        self.profiles = {}
        self.traces = []

        # Initialize profiles for all glyphs
        for idx, glyph in self.registry.glyphs.items():
            self.profiles[idx] = GlyphProfile(
                glyph_id=idx,
                stratum=glyph.stratum.name,
                opcode=glyph.opcode.name,
                rationale=glyph.metadata.rationale,
                execution_time_ms=0.0,
                dependencies=glyph.metadata.dependencies.copy()
            )

        # Run profiling iterations
        total_start = time.perf_counter()

        for i in range(iterations):
            self._run_profiled_execution()

        total_end = time.perf_counter()
        total_time_ms = (total_end - total_start) * 1000

        # Average execution times
        for idx, profile in self.profiles.items():
            profile.execution_time_ms /= iterations

        # Identify bottlenecks (top 20% slowest)
        sorted_profiles = sorted(self.profiles.values(), key=lambda p: p.execution_time_ms, reverse=True)
        bottleneck_threshold = max(1, len(sorted_profiles) // 5)
        for profile in sorted_profiles[:bottleneck_threshold]:
            profile.is_bottleneck = True

        # Identify hot path (critical path based on dependencies)
        hot_path = self._find_hot_path()
        for idx in hot_path:
            if idx in self.profiles:
                self.profiles[idx].hot_path = True

        # Calculate breakdowns
        strata_breakdown = defaultdict(float)
        opcode_breakdown = defaultdict(float)

        for profile in self.profiles.values():
            strata_breakdown[profile.stratum] += profile.execution_time_ms
            opcode_breakdown[profile.opcode] += profile.execution_time_ms

        # Validate coherence
        coherence = self._calculate_coherence()

        return ProfileReport(
            program_name=self.name,
            total_glyphs=len(self.registry.glyphs),
            total_time_ms=total_time_ms,
            avg_time_per_glyph_ms=total_time_ms / max(1, len(self.registry.glyphs)),
            profiles=list(self.profiles.values()),
            hot_path=hot_path,
            bottlenecks=[p.glyph_id for p in self.profiles.values() if p.is_bottleneck],
            strata_breakdown=dict(strata_breakdown),
            opcode_breakdown=dict(opcode_breakdown),
            coherence=coherence
        )

    def _run_profiled_execution(self):
        """Execute with profiling hooks."""
        # Custom executor that tracks timing
        for idx in sorted(self.registry.glyphs.keys()):
            glyph = self.registry.glyphs[idx]

            start_time = time.perf_counter()

            try:
                # Simulate execution (real execution would use GlyphStratumExecutor)
                # For profiling, we simulate based on opcode complexity
                simulated_time = self._simulate_execution_time(glyph)
                time.sleep(simulated_time / 1000)  # Convert ms to seconds

                end_time = time.perf_counter()
                elapsed_ms = (end_time - start_time) * 1000

                # Update profile
                self.profiles[idx].execution_time_ms += elapsed_ms
                self.execution_count[idx] += 1

                # Record trace
                self.traces.append(ExecutionTrace(
                    glyph_id=idx,
                    start_time=start_time,
                    end_time=end_time,
                    result="success"
                ))

            except Exception as e:
                end_time = time.perf_counter()
                elapsed_ms = (end_time - start_time) * 1000

                self.profiles[idx].execution_time_ms += elapsed_ms

                self.traces.append(ExecutionTrace(
                    glyph_id=idx,
                    start_time=start_time,
                    end_time=end_time,
                    error=str(e)
                ))

    def _simulate_execution_time(self, glyph) -> float:
        """
        Simulate execution time based on opcode complexity.

        In real usage, this would be replaced with actual execution.
        """
        # Base times in milliseconds (simulated)
        base_times = {
            Opcode.DATA: 0.01,
            Opcode.LOAD: 0.05,
            Opcode.STORE: 0.05,
            Opcode.ALLOC: 0.10,
            Opcode.FREE: 0.05,
            Opcode.CALL: 0.50,
            Opcode.BRANCH: 0.20,
            Opcode.LOOP: 1.00,
            Opcode.RETURN: 0.10,
            Opcode.EXPORT: 0.05,
            Opcode.MODULE: 0.02,
            Opcode.NOP: 0.01,
            Opcode.HALT: 0.01,
        }

        base_time = base_times.get(glyph.opcode, 0.10)

        # Add variance based on dependencies
        dep_factor = 1.0 + (len(glyph.metadata.dependencies) * 0.1)

        # Add small random variance (10%)
        import random
        variance = random.uniform(0.9, 1.1)

        return base_time * dep_factor * variance

    def _find_hot_path(self) -> List[int]:
        """Find the critical execution path."""
        # Find the INTENT glyph (should be the end of the hot path)
        intent_glyphs = [idx for idx, g in self.registry.glyphs.items()
                       if g.stratum == Stratum.INTENT]

        if not intent_glyphs:
            return []

        # Trace back from INTENT through dependencies
        hot_path = []
        visited = set()

        def trace_back(idx):
            if idx in visited:
                return
            visited.add(idx)

            glyph = self.registry.glyphs.get(idx)
            if glyph:
                # Visit dependencies first
                for dep in glyph.metadata.dependencies:
                    trace_back(dep)
                hot_path.append(idx)

        for idx in intent_glyphs:
            trace_back(idx)

        return hot_path

    def _calculate_coherence(self) -> float:
        """Calculate strata ordering coherence."""
        valid = 0
        total = 0

        stratum_order = {s: i for i, s in enumerate(Stratum)}

        for idx, glyph in self.registry.glyphs.items():
            for dep_idx in glyph.metadata.dependencies:
                total += 1
                dep = self.registry.glyphs.get(dep_idx)
                if dep:
                    if stratum_order[dep.stratum] <= stratum_order[glyph.stratum]:
                        valid += 1

        return valid / total if total > 0 else 1.0


def format_report(report: ProfileReport, detailed: bool = False) -> str:
    """Format profiling report for display."""
    lines = []
    lines.append("=" * 70)
    lines.append(f"GlyphStratum Performance Profile: {report.program_name}")
    lines.append("=" * 70)

    # Summary
    lines.append(f"\nSummary:")
    lines.append(f"  Total Glyphs: {report.total_glyphs}")
    lines.append(f"  Total Time: {report.total_time_ms:.2f}ms")
    lines.append(f"  Avg per Glyph: {report.avg_time_per_glyph_ms:.3f}ms")
    lines.append(f"  Coherence: {report.coherence*100:.1f}%")

    # Strata breakdown
    lines.append(f"\nStrata Breakdown:")
    for stratum in ["INTENT", "SPEC", "LOGIC", "MEMORY", "SUBSTRATE"]:
        time_ms = report.strata_breakdown.get(stratum, 0)
        pct = (time_ms / report.total_time_ms * 100) if report.total_time_ms > 0 else 0
        bar = "█" * int(pct / 5)
        lines.append(f"  {stratum:10} {time_ms:8.2f}ms {pct:5.1f}% {bar}")

    # Opcode breakdown
    lines.append(f"\nOpcode Breakdown:")
    sorted_opcodes = sorted(report.opcode_breakdown.items(), key=lambda x: x[1], reverse=True)
    for opcode, time_ms in sorted_opcodes[:8]:
        pct = (time_ms / report.total_time_ms * 100) if report.total_time_ms > 0 else 0
        lines.append(f"  {opcode:10} {time_ms:8.2f}ms {pct:5.1f}%")

    # Bottlenecks
    if report.bottlenecks:
        lines.append(f"\nBottlenecks (slowest glyphs):")
        bottleneck_profiles = [p for p in report.profiles if p.is_bottleneck]
        bottleneck_profiles.sort(key=lambda p: p.execution_time_ms, reverse=True)
        for p in bottleneck_profiles[:5]:
            lines.append(f"  [{p.glyph_id:2}] {p.stratum:10} {p.opcode:8} {p.execution_time_ms:8.2f}ms  {p.rationale[:40]}")

    # Hot path
    lines.append(f"\nHot Path (critical execution path):")
    hot_path_str = " → ".join(str(idx) for idx in report.hot_path[:10])
    if len(report.hot_path) > 10:
        hot_path_str += " ..."
    lines.append(f"  {hot_path_str}")

    # Detailed glyph list
    if detailed:
        lines.append(f"\nDetailed Glyph Profiles:")
        lines.append("-" * 70)
        for p in sorted(report.profiles, key=lambda x: x.execution_time_ms, reverse=True):
            flags = []
            if p.is_bottleneck:
                flags.append("BOTTLENECK")
            if p.hot_path:
                flags.append("HOT")
            flag_str = f" [{', '.join(flags)}]" if flags else ""

            lines.append(f"  [{p.glyph_id:2}] {p.stratum:10} {p.opcode:8} {p.execution_time_ms:8.3f}ms{flag_str}")
            lines.append(f"       {p.rationale[:60]}")

    lines.append("\n" + "=" * 70)

    return "\n".join(lines)


def export_profile_json(report: ProfileReport) -> str:
    """Export profiling report as JSON."""
    data = {
        "program_name": report.program_name,
        "summary": {
            "total_glyphs": report.total_glyphs,
            "total_time_ms": report.total_time_ms,
            "avg_time_per_glyph_ms": report.avg_time_per_glyph_ms,
            "coherence": report.coherence
        },
        "strata_breakdown": report.strata_breakdown,
        "opcode_breakdown": report.opcode_breakdown,
        "bottlenecks": report.bottlenecks,
        "hot_path": report.hot_path,
        "profiles": [
            {
                "id": p.glyph_id,
                "stratum": p.stratum,
                "opcode": p.opcode,
                "time_ms": p.execution_time_ms,
                "is_bottleneck": p.is_bottleneck,
                "hot_path": p.hot_path,
                "rationale": p.rationale
            }
            for p in report.profiles
        ]
    }
    return json.dumps(data, indent=2)


def export_flame_graph_json(report: ProfileReport) -> str:
    """Export in format compatible with flame_graph.html."""
    data = {
        "program_name": report.program_name,
        "total_glyphs": report.total_glyphs,
        "total_time_ms": report.total_time_ms,
        "avg_time_per_glyph_ms": report.avg_time_per_glyph_ms,
        "coherence": report.coherence * 100,  # Convert to percentage
        "profiles": [
            {
                "glyph_id": p.glyph_id,
                "stratum": p.stratum,
                "opcode": p.opcode,
                "rationale": p.rationale,
                "execution_time_ms": p.execution_time_ms,
                "is_bottleneck": p.is_bottleneck,
                "hot_path": p.hot_path,
                "dependencies": p.dependencies
            }
            for p in report.profiles
        ],
        "hot_path": report.hot_path,
        "bottlenecks": report.bottlenecks,
        "strata_breakdown": report.strata_breakdown,
        "opcode_breakdown": report.opcode_breakdown
    }
    return json.dumps(data, indent=2)


# Demo
if __name__ == "__main__":
    print("Loading sample program for profiling...\n")

    # Load sample program
    with open("sample_programs_loader.json") as f:
        data = json.load(f)

    # Profile each sample
    for name, sample in list(data["samples"].items())[:3]:
        # Create registry from sample
        registry = GlyphRegistry()
        for idx_str, g in sample["glyphs"].items():
            idx = int(idx_str)
            stratum = Stratum.from_value(g["stratum"])
            opcode = Opcode.from_value(g["opcode"])

            metadata = GlyphMetadata(
                dependencies=g.get("dependencies", []),
                runtime_refs=g.get("runtime_refs", []),
                rationale=g.get("rationale", ""),
                provenance=ProvenanceInfo()
            )

            glyph = GlyphInfo(
                index=idx,
                stratum=stratum,
                opcode=opcode,
                metadata=metadata
            )
            registry.glyphs[idx] = glyph

        # Profile
        profiler = GlyphProfiler(registry, name)
        report = profiler.profile_execution(iterations=10)

        # Print report
        print(format_report(report, detailed=False))
        print()
