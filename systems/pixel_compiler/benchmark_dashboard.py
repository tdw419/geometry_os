# systems/pixel_compiler/benchmark_dashboard.py
"""
Performance Dashboard for PixelRTS
Generates HTML reports and tracks performance over time.
"""

import json
from pathlib import Path
from typing import List, Dict
from datetime import datetime


class BenchmarkDashboard:
    """
    Generate HTML dashboard from benchmark results.
    """

    def __init__(self, results_dir: str = "benchmark_results"):
        """
        Initialize dashboard.

        Args:
            results_dir: Directory containing benchmark results
        """
        self.results_dir = Path(results_dir)
        self.history_file = self.results_dir / "benchmark_history.jsonl"

    def load_history(self) -> List[Dict]:
        """Load benchmark history from file."""
        if not self.history_file.exists():
            return []

        results = []
        with open(self.history_file, 'r') as f:
            for line in f:
                if line.strip():
                    results.append(json.loads(line))
        return results

    def generate_html(self, output_path: str = "benchmark_dashboard.html") -> str:
        """
        Generate HTML dashboard.

        Args:
            output_path: Output HTML file path

        Returns:
            Path to generated HTML file
        """
        results = self.load_history()

        # Group by test name
        by_test = {}
        for result in results:
            name = result.get('test_name', 'unknown')
            if name not in by_test:
                by_test[name] = []
            by_test[name].append(result)

        # Generate HTML
        html = self._generate_html_template(by_test)

        # Write to file
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, 'w') as f:
            f.write(html)

        return str(output_path)

    def _generate_html_template(self, by_test: Dict[str, List[Dict]]) -> str:
        """Generate HTML content."""

        # Calculate stats
        total_tests = len(by_test)
        total_runs = sum(len(results) for results in by_test.values())
        avg_throughput = []
        for results in by_test.values():
            for r in results:
                if 'throughput_mb_sec' in r:
                    avg_throughput.append(r['throughput_mb_sec'])

        if avg_throughput:
            overall_avg = sum(avg_throughput) / len(avg_throughput)
        else:
            overall_avg = 0

        # Generate chart data
        chart_data = self._generate_chart_data(by_test)

        html = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PixelRTS Performance Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <style>
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
            margin: 0;
            padding: 20px;
            background: #f5f5f5;
        }}
        .container {{
            max-width: 1200px;
            margin: 0 auto;
        }}
        .header {{
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
        }}
        .stats-grid {{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }}
        .stat-card {{
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }}
        .stat-value {{
            font-size: 2em;
            font-weight: bold;
            color: #667eea;
        }}
        .stat-label {{
            color: #666;
            margin-top: 5px;
        }}
        .chart-container {{
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }}
        .test-list {{
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }}
        .test-item {{
            padding: 15px;
            border-bottom: 1px solid #eee;
        }}
        .test-item:last-child {{
            border-bottom: none;
        }}
        .throughput-badge {{
            display: inline-block;
            padding: 5px 10px;
            background: #e3f2fd;
            color: #1976d2;
            border-radius: 4px;
            font-weight: bold;
        }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>PixelRTS Performance Dashboard</h1>
            <p>Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}</p>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-value">{total_tests}</div>
                <div class="stat-label">Unique Tests</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">{total_runs}</div>
                <div class="stat-label">Total Runs</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">{overall_avg:.2f} MB/s</div>
                <div class="stat-label">Average Throughput</div>
            </div>
        </div>

        <div class="chart-container">
            <h2>Throughput Over Time</h2>
            <canvas id="throughputChart"></canvas>
        </div>

        <div class="test-list">
            <h2>Test Results</h2>
            {self._generate_test_list_html(by_test)}
        </div>
    </div>

    <script>
        const chartData = {chart_data};

        new Chart(document.getElementById('throughputChart'), {{
            type: 'line',
            data: {{
                datasets: chartData
            }},
            options: {{
                responsive: true,
                scales: {{
                    x: {{
                        title: {{ display: true, text: 'Run Number' }}
                    }},
                    y: {{
                        title: {{ display: true, text: 'Throughput (MB/sec)' }},
                        beginAtZero: true
                    }}
                }}
            }}
        }});
    </script>
</body>
</html>"""
        return html

    def _generate_chart_data(self, by_test: Dict[str, List[Dict]]) -> str:
        """Generate chart data JSON."""
        datasets = []
        colors = [
            'rgb(102, 126, 234)',
            'rgb(118, 75, 162)',
            'rgb(237, 100, 166)',
            'rgb(255, 154, 158)',
            'rgb(250, 208, 196)'
        ]

        for i, (test_name, results) in enumerate(by_test.items()):
            data_points = []
            for r in results:
                if 'throughput_mb_sec' in r:
                    data_points.append(r['throughput_mb_sec'])

            if data_points:
                datasets.append({
                    'label': test_name,
                    'data': data_points,
                    'borderColor': colors[i % len(colors)],
                    'backgroundColor': colors[i % len(colors)].replace('rgb', 'rgba').replace(')', ', 0.1)')
                })

        return json.dumps(datasets)

    def _generate_test_list_html(self, by_test: Dict[str, List[Dict]]) -> str:
        """Generate HTML for test list."""
        items = []

        for test_name, results in by_test.items():
            latest = results[-1]
            throughput = latest.get('throughput_mb_sec', 0)
            size_mb = latest.get('data_size', 0) / (1024 * 1024)

            items.append(f"""
            <div class="test-item">
                <h3>{test_name}</h3>
                <p>Data Size: {size_mb:.1f}MB</p>
                <p>Latest Throughput: <span class="throughput-badge">{throughput:.2f} MB/s</span></p>
                <p>Runs: {len(results)}</p>
            </div>
            """)

        return ''.join(items)


def main():
    """CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Generate PixelRTS performance dashboard")
    parser.add_argument('--results-dir', default='benchmark_results',
                       help='Directory containing benchmark results')
    parser.add_argument('--output', default='benchmark_dashboard.html',
                       help='Output HTML file path')

    args = parser.parse_args()

    dashboard = BenchmarkDashboard(results_dir=args.results_dir)
    output_path = dashboard.generate_html(args.output)

    print(f"Dashboard generated: {output_path}")


if __name__ == '__main__':
    main()
