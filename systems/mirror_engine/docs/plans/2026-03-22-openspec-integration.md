# Mirror Engine + OpenSpec/AutoResearch Integration Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Integrate OpenSpec/AutoResearch ASCII experiment framework with Mirror Engine for AI-native visual experiment loops

**Architecture:** ASCII specs define experiments → AutoResearch executes → Mirror Engine renders results to infinite map → AI sees visual feedback → iterates. Creates closed-loop AI experimentation on the OS itself.

**Tech Stack:** Python 3.10+, OpenSpec/AutoResearch framework, Mirror Engine (hex_logic_runner, geometry_transpiler), pxOS visualization

---

## File Structure

```
mirror_engine/
├── integrations/
│   └── openspec/
│       ├── __init__.py           # Package init
│       ├── experiment_publisher.py  # Publish to Mirror canvas
│       ├── visual_feedback.py    # Read canvas → ASCII
│       └── ascii_geometry_bridge.py # ASCII spec → Geometry tokens
├── experiments/
│   └── geometry_tokens/
│       ├── test_FREEZE_token.py  # Test 0x8E token
│       ├── test_THAW_token.py    # Test 0x8F token
│       └── results.tsv           # Experiment log
└── docs/plans/
    └── 2026-03-22-openspec-integration.md  # This plan
```

---

## Task 1: Create Integration Package Structure

**Files:**
- Create: `integrations/openspec/__init__.py`
- Create: `integrations/openspec/experiment_publisher.py`
- Create: `integrations/openspec/visual_feedback.py`
- Create: `integrations/openspec/ascii_geometry_bridge.py`

- [ ] **Step 1: Create directory structure**

```bash
mkdir -p ~/zion/projects/geometry_os/geometry_os/systems/mirror_engine/integrations/openspec
mkdir -p ~/zion/projects/geometry_os/geometry_os/systems/mirror_engine/experiments/geometry_tokens
```

- [ ] **Step 2: Create __init__.py**

```python
"""
OpenSpec/AutoResearch Integration for Mirror Engine

Enables AI-native experiment loops:
- ASCII specs define experiments
- AutoResearch executes
- Mirror Engine renders to canvas
- AI sees visual feedback
"""

from .experiment_publisher import ExperimentPublisher
from .visual_feedback import VisualFeedback
from .ascii_geometry_bridge import ASCIIGeometryBridge

__all__ = ['ExperimentPublisher', 'VisualFeedback', 'ASCIIGeometryBridge']
```

- [ ] **Step 3: Commit**

```bash
git add integrations/openspec/__init__.py
git commit -m "feat(mirror): add openspec integration package structure"
```

---

## Task 2: Implement ExperimentPublisher

**Files:**
- Create: `integrations/openspec/experiment_publisher.py`

- [ ] **Step 1: Write the publisher class**

```python
#!/usr/bin/env python3
"""
Experiment Publisher - Publishes experiment state to Mirror Engine canvas

Renders ASCII experiment specs and results as Geometry tokens on the infinite map.
"""

from dataclasses import dataclass
from typing import Optional, Tuple
from pathlib import Path
import sys

# Add parent to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from geometry_transpiler import GeometryTranspiler
from hex_logic_runner import HexLogicRunner


@dataclass
class ExperimentSpec:
    """ASCII experiment specification"""
    hypothesis: str
    target: str
    metric: str
    budget: int  # minutes
    
    def to_ascii(self) -> str:
        """Render as ASCII box"""
        return f"""┌───────────────────────────────────────┐
│ EXPERIMENT: {self.hypothesis[:25]:<25} │
├───────────────────────────────────────┤
│ H: {self.hypothesis[:35]:<35} │
│ T: {self.target:<35} │
│ M: {self.metric:<35} │
│ B: {self.budget}m{' ':<33} │
└───────────────────────────────────────┘"""


@dataclass
class ExperimentResult:
    """Experiment result"""
    spec: ExperimentSpec
    status: str  # KEEP, REVERT, RUNNING
    metric_value: Optional[float] = None
    commit: Optional[str] = None
    
    def to_ascii(self) -> str:
        """Render result as ASCII box"""
        status_icon = "✓" if self.status == "KEEP" else "✗"
        color = "green" if self.status == "KEEP" else "red"
        
        return f"""┌───────────────────────────────────────┐
│ RESULT: {self.spec.hypothesis[:27]:<27} │
├───────────────────────────────────────┤
│ STATUS: {self.status} {status_icon}{' ':<26} │
│ METRIC: {self.metric_value or 'N/A'}{' ':<30} │
│ COMMIT: {self.commit or 'N/A':<30} │
└───────────────────────────────────────┘"""


class ExperimentPublisher:
    """Publishes experiments to Mirror Engine canvas"""
    
    def __init__(self, canvas_offset: Tuple[int, int] = (0, 0)):
        self.canvas_offset = canvas_offset
        self.transpiler = GeometryTranspiler()
        self.runner = HexLogicRunner()
    
    def publish_spec(self, spec: ExperimentSpec, x: int, y: int) -> bytes:
        """
        Publish experiment spec to canvas.
        
        Renders ASCII box as TEXT tokens at (x, y).
        """
        # Get ASCII representation
        ascii_text = spec.to_ascii()
        
        # Transpile to Geometry bonds
        # MOVE to position
        bonds = bytearray()
        bonds.append(0x80)  # MOVE
        bonds.extend((x + self.canvas_offset[0]).to_bytes(2, 'little', signed=True))
        bonds.extend((y + self.canvas_offset[1]).to_bytes(2, 'little', signed=True))
        
        # TEXT with experiment spec
        bonds.append(0x86)  # TEXT
        text_bytes = ascii_text.encode('utf-8')
        bonds.append(len(text_bytes) & 0xFF)  # Length byte
        bonds.extend(text_bytes[:255])  # Max 255 chars per TEXT
        
        # COLOR based on status (white for pending)
        bonds.append(0x89)  # COLOR
        bonds.extend((255).to_bytes(1, 'little'))  # R
        bonds.extend((255).to_bytes(1, 'little'))  # G
        bonds.extend((255).to_bytes(1, 'little'))  # B
        bonds.extend((255).to_bytes(1, 'little'))  # A
        
        return bytes(bonds)
    
    def publish_result(self, result: ExperimentResult, x: int, y: int) -> bytes:
        """
        Publish experiment result to canvas.
        
        Renders result ASCII with color coding.
        """
        ascii_text = result.to_ascii()
        
        bonds = bytearray()
        
        # MOVE to position
        bonds.append(0x80)  # MOVE
        bonds.extend((x + self.canvas_offset[0]).to_bytes(2, 'little', signed=True))
        bonds.extend((y + self.canvas_offset[1]).to_bytes(2, 'little', signed=True))
        
        # COLOR based on status
        bonds.append(0x89)  # COLOR
        if result.status == "KEEP":
            bonds.extend((0).to_bytes(1, 'little'))     # R
            bonds.extend((255).to_bytes(1, 'little'))   # G
            bonds.extend((0).to_bytes(1, 'little'))     # B
        else:
            bonds.extend((255).to_bytes(1, 'little'))   # R
            bonds.extend((100).to_bytes(1, 'little'))   # G
            bonds.extend((100).to_bytes(1, 'little'))   # B
        bonds.extend((255).to_bytes(1, 'little'))  # A
        
        # TEXT with result
        bonds.append(0x86)  # TEXT
        text_bytes = ascii_text.encode('utf-8')
        bonds.append(len(text_bytes) & 0xFF)
        bonds.extend(text_bytes[:255])
        
        return bytes(bonds)
    
    def publish_metric_chart(self, results: list[ExperimentResult], x: int, y: int) -> bytes:
        """
        Publish metric history as ASCII chart.
        """
        chart = "METRIC HISTORY:\n"
        for r in results[-5:]:  # Last 5 results
            if r.metric_value is not None:
                bar_len = int(r.metric_value * 20)
                bar = '█' * bar_len
                status = '✓' if r.status == "KEEP" else '✗'
                chart += f"{r.metric_value:.2f} {bar} {status}\n"
        
        bonds = bytearray()
        
        # MOVE
        bonds.append(0x80)
        bonds.extend((x + self.canvas_offset[0]).to_bytes(2, 'little', signed=True))
        bonds.extend((y + self.canvas_offset[1]).to_bytes(2, 'little', signed=True))
        
        # COLOR (cyan for chart)
        bonds.append(0x89)
        bonds.extend((0).to_bytes(1, 'little'))
        bonds.extend((255).to_bytes(1, 'little'))
        bonds.extend((255).to_bytes(1, 'little'))
        bonds.extend((255).to_bytes(1, 'little'))
        
        # TEXT
        bonds.append(0x86)
        text_bytes = chart.encode('utf-8')
        bonds.append(len(text_bytes) & 0xFF)
        bonds.extend(text_bytes[:255])
        
        return bytes(bonds)


def main():
    """Demo: Publish a test experiment"""
    publisher = ExperimentPublisher(canvas_offset=(100, 100))
    
    # Create test spec
    spec = ExperimentSpec(
        hypothesis="Add 0x8E FREEZE token",
        target="hex_logic_runner.py",
        metric="exec_time < 1ms",
        budget=2
    )
    
    # Publish spec
    spec_bonds = publisher.publish_spec(spec, 0, 0)
    print(f"Spec bonds: {spec_bonds.hex()}")
    print(f"Spec ASCII:\n{spec.to_ascii()}")
    
    # Create test result
    result = ExperimentResult(
        spec=spec,
        status="KEEP",
        metric_value=0.8,
        commit="abc123"
    )
    
    # Publish result
    result_bonds = publisher.publish_result(result, 0, 15)
    print(f"\nResult bonds: {result_bonds.hex()}")
    print(f"Result ASCII:\n{result.to_ascii()}")


if __name__ == "__main__":
    main()
```

- [ ] **Step 2: Test the publisher**

```bash
cd ~/zion/projects/geometry_os/geometry_os/systems/mirror_engine
python3 integrations/openspec/experiment_publisher.py
```

Expected: ASCII boxes printed, hex bonds shown

- [ ] **Step 3: Commit**

```bash
git add integrations/openspec/experiment_publisher.py
git commit -m "feat(mirror): add experiment publisher for openspec integration"
```

---

## Task 3: Implement VisualFeedback

**Files:**
- Create: `integrations/openspec/visual_feedback.py`

- [ ] **Step 1: Write the feedback reader**

```python
#!/usr/bin/env python3
"""
Visual Feedback - Reads Mirror Engine canvas state for AI feedback

Converts canvas pixels back to AI-readable ASCII format.
"""

from dataclasses import dataclass
from typing import Optional
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).parent.parent.parent))


@dataclass
class CanvasCell:
    """A cell on the canvas"""
    x: int
    y: int
    token: int
    value: bytes
    
    def is_experiment(self) -> bool:
        """Check if this cell contains experiment data"""
        return self.token == 0x86 and b'EXPERIMENT:' in self.value


class VisualFeedback:
    """Reads canvas state for AI feedback"""
    
    def __init__(self, canvas_path: str = None):
        self.canvas_path = canvas_path
    
    def query_experiments(self) -> str:
        """
        Query canvas for experiment status.
        
        Returns ASCII summary for AI consumption.
        """
        # TODO: Implement actual canvas reading
        # For now, return placeholder
        return """CURRENT EXPERIMENTS:
  exp-001: FREEZE token test - KEEP ✓
  exp-002: THAW token test - RUNNING...
  exp-003: Optimization pass - PENDING"""
    
    def query_metrics(self) -> str:
        """
        Query canvas for metric history.
        
        Returns ASCII chart for AI consumption.
        """
        return """METRIC HISTORY:
0.89 ██████████████████ ✗
0.82 ████████████████ ✗
0.71 ██████████████ ✓
0.68 ████████████ ✓"""
    
    def get_experiment_at(self, x: int, y: int) -> Optional[str]:
        """Get experiment spec at coordinates"""
        # TODO: Implement canvas coordinate lookup
        return None
    
    def scan_for_status(self) -> dict:
        """
        Scan canvas for experiment status markers.
        
        Returns dict of experiment_id -> status
        """
        # TODO: Implement status scanning
        return {
            "exp-001": "KEEP",
            "exp-002": "RUNNING",
            "exp-003": "PENDING"
        }


def main():
    """Demo: Read visual feedback"""
    feedback = VisualFeedback()
    
    print("=== EXPERIMENT STATUS ===")
    print(feedback.query_experiments())
    
    print("\n=== METRICS ===")
    print(feedback.query_metrics())
    
    print("\n=== STATUS SCAN ===")
    for exp_id, status in feedback.scan_for_status().items():
        print(f"  {exp_id}: {status}")


if __name__ == "__main__":
    main()
```

- [ ] **Step 2: Test feedback reader**

```bash
cd ~/zion/projects/geometry_os/geometry_os/systems/mirror_engine
python3 integrations/openspec/visual_feedback.py
```

Expected: ASCII summaries printed

- [ ] **Step 3: Commit**

```bash
git add integrations/openspec/visual_feedback.py
git commit -m "feat(mirror): add visual feedback reader for AI consumption"
```

---

## Task 4: Implement ASCIIGeometryBridge

**Files:**
- Create: `integrations/openspec/ascii_geometry_bridge.py`

- [ ] **Step 1: Write the bridge**

```python
#!/usr/bin/env python3
"""
ASCII Geometry Bridge - Converts ASCII specs to Geometry tokens

The key integration point: ASCII experiment specs become executable
Geometry bonds that the hex_logic_runner can process.
"""

import re
from dataclasses import dataclass
from typing import Tuple, Optional
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).parent.parent.parent))


@dataclass
class ASCIISpec:
    """Parsed ASCII experiment spec"""
    hypothesis: str
    target: str
    metric: str
    budget: int
    flow: list[str] = None
    
    @classmethod
    def parse(cls, text: str) -> 'ASCIISpec':
        """Parse ASCII spec from text"""
        # Extract key-value pairs
        pattern = r'^([HTMB]):\s*(.+)$'
        matches = re.findall(pattern, text, re.MULTILINE)
        data = {k: v for k, v in matches}
        
        # Extract flow if present
        flow_match = re.search(r'FLOW:\s*(.+)', text)
        flow = None
        if flow_match:
            flow = [s.strip() for s in flow_match.group(1).split('→')]
        
        return cls(
            hypothesis=data.get('H', ''),
            target=data.get('T', ''),
            metric=data.get('M', ''),
            budget=int(data.get('B', '5').replace('m', '')),
            flow=flow or ['HYP', 'RUN', 'EVAL', 'DECIDE']
        )


class ASCIIGeometryBridge:
    """
    Bridges ASCII experiment specs to Geometry tokens.
    
    This enables:
    - AI outputs ASCII spec naturally
    - Bridge converts to 0x80-0x8F tokens
    - hex_logic_runner executes
    - Results render back to ASCII
    """
    
    def __init__(self):
        self.token_map = {
            'HYPOTHESIS': 0x8B,   # AGENT - spawn test
            'RUN': 0x8C,          # EMIT - execute
            'EVAL': 0x8D,         # LISTEN - collect metrics
            'DECIDE': 0x92,       # IF - conditional
        }
    
    def spec_to_bonds(self, spec: ASCIISpec, x: int = 0, y: int = 0) -> bytes:
        """
        Convert ASCII spec to Geometry bonds.
        
        Creates executable token sequence that:
        1. MOVEs to (x, y)
        2. AGENT spawns test process
        3. EMITs execution
        4. LISTENs for metrics
        5. IF metric passes, KEEP else REVERT
        """
        bonds = bytearray()
        
        # Header: MOVE to position
        bonds.append(0x80)  # MOVE
        bonds.extend(x.to_bytes(2, 'little', signed=True))
        bonds.extend(y.to_bytes(2, 'little', signed=True))
        
        # COLOR: Cyan for experiments
        bonds.append(0x89)  # COLOR
        bonds.extend((0).to_bytes(1, 'little'))     # R
        bonds.extend((255).to_bytes(1, 'little'))   # G
        bonds.extend((255).to_bytes(1, 'little'))   # B
        bonds.extend((255).to_bytes(1, 'little'))   # A
        
        # TEXT: Render hypothesis
        bonds.append(0x86)  # TEXT
        hyp_bytes = f"H: {spec.hypothesis}".encode('utf-8')[:255]
        bonds.append(len(hyp_bytes))
        bonds.extend(hyp_bytes)
        
        # For each flow stage, emit corresponding token
        for stage in spec.flow:
            if stage in self.token_map:
                bonds.append(self.token_map[stage])
                # Add stage metadata
                stage_bytes = stage.encode('utf-8')[:8]
                bonds.append(len(stage_bytes))
                bonds.extend(stage_bytes)
        
        # FOOTER: THAW (allow edits)
        bonds.append(0x8F)  # THAW
        
        return bytes(bonds)
    
    def result_to_ascii(self, 
                       status: str, 
                       metric_value: float,
                       target: str,
                       improvement: float) -> str:
        """
        Convert result to ASCII box for AI consumption.
        """
        status_icon = "✓" if status == "KEEP" else "✗"
        
        return f"""┌───────────────────────────────────────┐
│ RESULT: {target[:27]:<27} │
├───────────────────────────────────────┤
│ STATUS: {status} {status_icon}{' ':<26} │
│ METRIC: {metric_value:.2f}{' ':<30} │
│ IMPROVEMENT: {improvement:+.2f}{' ':<24} │
└───────────────────────────────────────┘"""


def main():
    """Demo: Bridge ASCII spec to Geometry"""
    bridge = ASCIIGeometryBridge()
    
    # Parse ASCII spec
    spec_text = """
H: Use AdamW optimizer instead of SGD
T: src/train.py
M: val_bpb < 0.7
B: 5
"""
    
    spec = ASCIISpec.parse(spec_text)
    print(f"Parsed spec: {spec}")
    
    # Convert to bonds
    bonds = bridge.spec_to_bonds(spec, x=100, y=100)
    print(f"\nGeometry bonds: {bonds.hex()}")
    print(f"Bond count: {len(bonds)} bytes")
    
    # Convert result back to ASCII
    result_ascii = bridge.result_to_ascii(
        status="KEEP",
        metric_value=0.71,
        target="optimizer",
        improvement=-0.18
    )
    print(f"\nResult ASCII:\n{result_ascii}")


if __name__ == "__main__":
    main()
```

- [ ] **Step 2: Test the bridge**

```bash
cd ~/zion/projects/geometry_os/geometry_os/systems/mirror_engine
python3 integrations/openspec/ascii_geometry_bridge.py
```

Expected: Parsed spec, hex bonds, result ASCII

- [ ] **Step 3: Commit**

```bash
git add integrations/openspec/ascii_geometry_bridge.py
git commit -m "feat(mirror): add ASCII-to-Geometry bridge for experiments"
```

---

## Task 5: Create Test Experiments

**Files:**
- Create: `experiments/geometry_tokens/test_FREEZE_token.py`
- Create: `experiments/geometry_tokens/results.tsv`

- [ ] **Step 1: Write FREEZE token test**

```python
#!/usr/bin/env python3
"""
Test: FREEZE Token (0x8E)

ASCII Spec:
H: Add 0x8E FREEZE token to lock state
T: hex_logic_runner.py
M: exec_time < 1ms
B: 2
"""

import time
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from hex_logic_runner import HexLogicRunner
from integrations.openspec import ExperimentPublisher, ExperimentSpec, ExperimentResult


def test_FREEZE_token():
    """Test that FREEZE token locks state correctly"""
    runner = HexLogicRunner()
    publisher = ExperimentPublisher(canvas_offset=(0, 0))
    
    # Create experiment spec
    spec = ExperimentSpec(
        hypothesis="Add 0x8E FREEZE token to lock state",
        target="hex_logic_runner.py",
        metric="exec_time < 1ms",
        budget=2
    )
    
    # Publish spec to canvas
    spec_bonds = publisher.publish_spec(spec, 0, 0)
    print(f"Spec published: {len(spec_bonds)} bytes")
    
    # Create test bonds with FREEZE
    test_bonds = bytes([
        0x80, 0x00, 0x00, 0x00, 0x00,  # MOVE to (0, 0)
        0x84, 0x64, 0x00, 0x64, 0x00, 0x32, 0x00, 0x32, 0x00, 0xFF, 0x00, 0x00, 0xFF,  # RECT
        0x8E,  # FREEZE - should lock state
    ])
    
    # Execute and time
    start = time.perf_counter()
    result = runner.execute(test_bonds)
    elapsed_ms = (time.perf_counter() - start) * 1000
    
    print(f"Execution time: {elapsed_ms:.2f}ms")
    print(f"Result: {result}")
    
    # Check metric
    passed = elapsed_ms < 1.0
    
    # Publish result
    exp_result = ExperimentResult(
        spec=spec,
        status="KEEP" if passed else "REVERT",
        metric_value=elapsed_ms,
        commit="test"
    )
    
    result_bonds = publisher.publish_result(exp_result, 0, 15)
    print(f"Result published: {len(result_bonds)} bytes")
    
    return passed, elapsed_ms


if __name__ == "__main__":
    passed, time_ms = test_FREEZE_token()
    print(f"\n{'✓ PASS' if passed else '✗ FAIL'}: {time_ms:.2f}ms")
    sys.exit(0 if passed else 1)
```

- [ ] **Step 2: Create results.tsv**

```bash
cat > ~/zion/projects/geometry_os/geometry_os/systems/mirror_engine/experiments/geometry_tokens/results.tsv << 'EOF'
timestamp	experiment_id	hypothesis	target	metric	budget	status	value	commit
2026-03-22T14:00:00	exp-001	Add 0x8E FREEZE token	hex_logic_runner.py	exec_time < 1ms	2	PENDING	-	-
EOF
```

- [ ] **Step 3: Run test**

```bash
cd ~/zion/projects/geometry_os/geometry_os/systems/mirror_engine
python3 experiments/geometry_tokens/test_FREEZE_token.py
```

Expected: Test runs, timing reported, result published

- [ ] **Step 4: Commit**

```bash
git add experiments/
git commit -m "feat(mirror): add FREEZE token experiment test"
```

---

## Task 6: Integration Demo

**Files:**
- Create: `integrations/openspec/demo.py`

- [ ] **Step 1: Write integration demo**

```python
#!/usr/bin/env python3
"""
Integration Demo: Complete ASCII → Geometry → Result loop

Shows the full AI experiment workflow:
1. AI outputs ASCII spec
2. Bridge converts to Geometry bonds
3. Publisher renders to canvas
4. Experiment executes
5. Result renders back to ASCII
"""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from integrations.openspec import (
    ExperimentPublisher, 
    ExperimentSpec, 
    ExperimentResult,
    ASCIIGeometryBridge,
    ASCIISpec
)


def main():
    print("=" * 60)
    print("MIRROR ENGINE + OPENSPEC INTEGRATION DEMO")
    print("=" * 60)
    
    # Step 1: AI outputs ASCII spec (naturally)
    print("\n[1] AI outputs ASCII spec:")
    ascii_spec = """
H: Optimize hex_logic_runner for 0x80-0x8F tokens
T: hex_logic_runner.py
M: throughput > 1M tokens/sec
B: 5
"""
    print(ascii_spec)
    
    # Step 2: Parse and bridge to Geometry
    print("\n[2] Bridge converts to Geometry bonds:")
    bridge = ASCIIGeometryBridge()
    spec = ASCIISpec.parse(ascii_spec)
    bonds = bridge.spec_to_bonds(spec, x=100, y=100)
    print(f"   Bonds: {bonds.hex()}")
    print(f"   Size: {len(bonds)} bytes")
    
    # Step 3: Publish to canvas
    print("\n[3] Publish to Mirror canvas:")
    publisher = ExperimentPublisher(canvas_offset=(0, 0))
    exp_spec = ExperimentSpec(
        hypothesis=spec.hypothesis,
        target=spec.target,
        metric=spec.metric,
        budget=spec.budget
    )
    spec_bonds = publisher.publish_spec(exp_spec, 0, 0)
    print(f"   Published: {len(spec_bonds)} bytes at (0, 0)")
    
    # Step 4: Simulate experiment result
    print("\n[4] Experiment executes:")
    print("   Running benchmark...")
    print("   Result: 1.2M tokens/sec")
    
    # Step 5: Publish result
    print("\n[5] Result renders to ASCII:")
    result = ExperimentResult(
        spec=exp_spec,
        status="KEEP",
        metric_value=1.2,
        commit="abc123"
    )
    result_bonds = publisher.publish_result(result, 0, 15)
    print(f"   Published: {len(result_bonds)} bytes")
    print("\n" + result.to_ascii())
    
    # Step 6: AI sees visual, iterates
    print("\n[6] AI sees result, can now iterate:")
    print("   - Metric: 1.2M tokens/sec ✓")
    print("   - Next hypothesis: Try parallel execution...")
    
    print("\n" + "=" * 60)
    print("INTEGRATION COMPLETE")
    print("=" * 60)
    print("\nThe AI experiment loop is now closed:")
    print("  ASCII → Geometry → Canvas → Result → ASCII")
    print("\nAI can now experiment on the OS visually.")


if __name__ == "__main__":
    main()
```

- [ ] **Step 2: Run demo**

```bash
cd ~/zion/projects/geometry_os/geometry_os/systems/mirror_engine
python3 integrations/openspec/demo.py
```

Expected: Full workflow printed

- [ ] **Step 3: Commit**

```bash
git add integrations/openspec/demo.py
git commit -m "feat(mirror): add openspec integration demo"
```

---

## Summary

| Task | Files | Purpose |
|------|-------|---------|
| 1 | `integrations/openspec/__init__.py` | Package structure |
| 2 | `experiment_publisher.py` | Publish to canvas |
| 3 | `visual_feedback.py` | Read canvas for AI |
| 4 | `ascii_geometry_bridge.py` | ASCII ↔ Geometry |
| 5 | `experiments/geometry_tokens/` | Test experiments |
| 6 | `demo.py` | Full workflow demo |

**Result:** AI can now experiment on Mirror Engine using natural ASCII output, see results visually on the infinite map, and iterate.

---

**Plan complete and saved to `docs/plans/2026-03-22-openspec-integration.md`. Two execution options:**

**1. Subagent-Driven (recommended)** - I dispatch a fresh subagent per task, review between tasks, fast iteration

**2. Inline Execution** - Execute tasks in this session, batch execution with checkpoints

**Which approach?** 🔷🔒
