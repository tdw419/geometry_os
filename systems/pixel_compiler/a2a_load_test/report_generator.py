"""Report generation for scale testing."""
import json
from dataclasses import dataclass, field
from datetime import datetime
from typing import List, Dict, Any


@dataclass
class StressTestReport:
    """Stress test report with results and recommendations."""
    title: str
    timestamp: str = field(default_factory=lambda: datetime.utcnow().isoformat() + "Z")
    results: List[Dict[str, Any]] = field(default_factory=list)
    limits: List[Dict[str, Any]] = field(default_factory=list)

    def add_result(
        self,
        scenario: str,
        agent_count: int,
        success: bool,
        throughput: float,
        avg_latency_ms: float,
        **kwargs
    ):
        """Add a scenario result."""
        self.results.append({
            "scenario": scenario,
            "agent_count": agent_count,
            "success": success,
            "throughput_msg_per_sec": throughput,
            "avg_latency_ms": avg_latency_ms,
            **kwargs
        })

    def add_limit(self, limit_type: str, value: int, description: str):
        """Add a discovered limit."""
        self.limits.append({
            "type": limit_type,
            "value": value,
            "description": description
        })

    def to_markdown(self) -> str:
        """Generate markdown report."""
        lines = [
            f"# {self.title}",
            "",
            f"**Generated:** {self.timestamp}",
            "",
            "## Results",
            "",
            "| Scenario | Agents | Status | Throughput | Latency (avg) |",
            "|----------|--------|--------|------------|---------------|"
        ]

        for r in self.results:
            status = "PASS" if r["success"] else "FAIL"
            lines.append(
                f"| {r['scenario']} | {r['agent_count']} | {status} | "
                f"{r['throughput_msg_per_sec']:.0f} msg/s | {r['avg_latency_ms']:.1f}ms |"
            )

        if self.limits:
            lines.extend([
                "",
                "## Discovered Limits",
                ""
            ])
            for limit in self.limits:
                lines.append(f"- **{limit['type']}:** {limit['value']} - {limit['description']}")

        recommendations = self.get_recommendations()
        if recommendations:
            lines.extend([
                "",
                "## Recommendations",
                ""
            ])
            for rec in recommendations:
                lines.append(f"- {rec}")

        return "\n".join(lines)

    def to_json(self) -> str:
        """Generate JSON report."""
        return json.dumps({
            "title": self.title,
            "timestamp": self.timestamp,
            "results": self.results,
            "limits": self.limits,
            "recommendations": self.get_recommendations()
        }, indent=2)

    def get_recommendations(self) -> List[str]:
        """Generate recommendations based on results."""
        recommendations = []

        for r in self.results:
            if not r["success"]:
                recommendations.append(
                    f"Investigate failure in '{r['scenario']}' scenario at {r['agent_count']} agents"
                )
            if r["avg_latency_ms"] > 100:
                recommendations.append(
                    f"High latency ({r['avg_latency_ms']:.0f}ms) in '{r['scenario']}' - consider optimization"
                )

        if not recommendations:
            recommendations.append("All tests passed - system is ready for production scale")

        return recommendations


class ReportGenerator:
    """Generates reports from stress test runs."""

    def __init__(self, output_dir: str = "./reports"):
        self.output_dir = output_dir

    def generate(self, report: StressTestReport, formats: List[str] = None) -> Dict[str, str]:
        """Generate report in specified formats."""
        formats = formats or ["markdown", "json"]
        outputs = {}

        for fmt in formats:
            if fmt == "markdown":
                outputs["markdown"] = report.to_markdown()
            elif fmt == "json":
                outputs["json"] = report.to_json()

        return outputs
