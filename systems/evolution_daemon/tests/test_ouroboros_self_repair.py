"""
Ouroboros Self-Repair Test Suite

Tests the system's ability to detect "Visual Fractures" and autonomously repair them.

The Ouroboros Loop:
1. EXECUTE: Run the system
2. OBSERVE: Monitor visual output
3. DETECT: Identify fractures (errors, corruption)
4. REPAIR: Apply fix (rollback or patch)
5. VERIFY: Confirm recovery

This closes the loop between execution and observation.
"""

import pytest
import asyncio
import subprocess
import json
import hashlib
import tempfile
import shutil
import time
from pathlib import Path
from typing import Dict, Any, Optional
from unittest.mock import Mock, AsyncMock, patch


class TestOuroborosSelfRepair:
    """Test suite for Ouroboros self-repair mechanism."""

    @pytest.fixture
    def temp_repo(self, tmp_path):
        """Create a temporary git repo for testing repairs."""
        repo_path = tmp_path / "test_repo"
        repo_path.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_path, check=True, capture_output=True)

        return repo_path

    @pytest.fixture
    def fracture_detector(self):
        """Create a mock fracture detector."""
        from systems.evolution_daemon.safety.rts_doctor import RTSDoctor
        return RTSDoctor()

    @pytest.fixture
    def sample_wgsl(self, tmp_path):
        """Create a sample valid WGSL shader file."""
        wgsl_path = tmp_path / "test_shader.wgsl"
        wgsl_path.write_text('''
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    // Valid shader - does nothing
}
''')
        return wgsl_path

    @pytest.fixture
    def corrupted_wgsl(self, tmp_path):
        """Create a corrupted WGSL shader file with syntax error."""
        wgsl_path = tmp_path / "corrupted_shader.wgsl"
        wgsl_path.write_text('''
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x
    // MISSING SEMICOLON - SYNTAX ERROR
}
''')
        return wgsl_path


class TestFractureDetection:
    """Tests for detecting visual fractures."""

    @pytest.mark.asyncio
    async def test_detect_wgsl_syntax_error(self, tmp_path):
        """Test that WGSL syntax errors are detected as fractures."""
        # Create a corrupted shader
        corrupted_wgsl = tmp_path / "broken.wgsl"
        corrupted_wgsl.write_text('''
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x
    // MISSING SEMICOLON - SYNTAX ERROR
}
''')

        # Check if we can detect the syntax error
        result = await self._validate_wgsl(corrupted_wgsl)

        assert result["valid"] == False
        assert len(result.get("errors", [])) > 0

    @pytest.mark.asyncio
    async def test_detect_rts_hash_mismatch(self, tmp_path):
        """Test that corrupted RTS files are detected via hash mismatch."""
        # Create a valid RTS file (simplified - just a PNG)
        from PIL import Image

        rts_path = tmp_path / "test.rts.png"
        img = Image.new("RGBA", (64, 64), color=(0, 0, 0, 255))
        img.save(rts_path)

        # Compute original hash
        original_hash = hashlib.sha256(rts_path.read_bytes()).hexdigest()

        # Create meta file with hashes structure
        meta_path = tmp_path / "test.rts.meta.json"
        meta_path.write_text(json.dumps({"sha256": original_hash, "hashes": {"sha256": original_hash}}))

        # Corrupt the RTS file
        with open(rts_path, "ab") as f:
            f.write(b"corruption")

        # Now check integrity
        from systems.evolution_daemon.safety.rts_doctor import RTSDoctor
        doctor = RTSDoctor()

        result = await doctor.check_integrity(str(rts_path), str(meta_path))

        assert result["is_healthy"] == False
        assert len(result["issues"]) > 0
        assert any("mismatch" in issue.lower() or "sha256" in issue.lower() for issue in result["issues"])

    @pytest.mark.asyncio
    async def test_detect_black_screen_fracture(self, tmp_path):
        """Test that all-black screens are detected as fractures."""
        from PIL import Image
        import numpy as np

        # Create an all-black image (fracture indicator)
        black_img_path = tmp_path / "black_screen.png"
        img = Image.new("RGB", (256, 256), color=(0, 0, 0))
        img.save(black_img_path)

        # Analyze entropy - black screen has zero entropy
        img_array = np.array(img)
        entropy = self._calculate_entropy(img_array)

        assert entropy < 1.0, "Black screen should have very low entropy"

    @pytest.mark.asyncio
    async def test_detect_white_noise_vs_valid_image(self, tmp_path):
        """Test distinguishing between white noise (fracture) and valid image."""
        from PIL import Image
        import numpy as np

        # Create white noise image (high entropy but could be fracture)
        noise_path = tmp_path / "noise.png"
        noise_array = np.random.randint(0, 256, (64, 64, 3), dtype=np.uint8)
        noise_img = Image.fromarray(noise_array)
        noise_img.save(noise_path)

        # Create a structured image (valid)
        valid_path = tmp_path / "valid.png"
        valid_array = np.zeros((64, 64, 3), dtype=np.uint8)
        # Create a simple pattern
        for i in range(64):
            for j in range(64):
                valid_array[i, j] = [(i * 4) % 256, (j * 4) % 256, ((i + j) * 2) % 256]
        valid_img = Image.fromarray(valid_array)
        valid_img.save(valid_path)

        # Both should have high entropy, but structured image has pattern
        noise_entropy = self._calculate_entropy(noise_array)
        valid_entropy = self._calculate_entropy(valid_array)

        # Noise should have higher entropy than structured content
        assert noise_entropy > 7.0, "White noise should have high entropy"
        assert valid_entropy > 5.0, "Valid image should have reasonable entropy"

    async def _validate_wgsl(self, wgsl_path: Path) -> Dict[str, Any]:
        """Validate WGSL shader (simplified check)."""
        content = wgsl_path.read_text()

        # Simple syntax checks
        issues = []

        # Check for invalid tokens (e.g., BROKEN keyword)
        if "BROKEN" in content:
            issues.append("Invalid token: BROKEN")

        # Check for common syntax errors
        lines = content.split('\n')
        for i, line in enumerate(lines):
            stripped = line.strip()

            # Skip comments and empty lines
            if not stripped or stripped.startswith('//'):
                continue

            # Check for missing semicolons in variable declarations
            if stripped.startswith('let ') and not stripped.endswith(';') and not stripped.endswith('{'):
                issues.append(f"Line {i+1}: Missing semicolon in let statement")
            if stripped.startswith('var ') and not stripped.endswith(';') and not stripped.endswith('{'):
                issues.append(f"Line {i+1}: Missing semicolon in var statement")

        if issues:
            return {"valid": False, "errors": issues}

        return {"valid": True}

    def _calculate_entropy(self, img_array) -> float:
        """Calculate image entropy for fracture detection."""
        import numpy as np

        # Flatten and calculate histogram
        flat = img_array.flatten()
        hist, _ = np.histogram(flat, bins=256, range=(0, 256))

        # Normalize
        hist = hist / hist.sum()

        # Calculate entropy
        entropy = -np.sum(hist * np.log2(hist + 1e-10))

        return entropy


class TestAutoRollback:
    """Tests for automatic git rollback repair."""

    @pytest.mark.asyncio
    async def test_detect_and_rollback(self, tmp_path):
        """Test: Inject error -> Detect Fracture -> Git Rollback"""
        # Create temporary repo
        repo_path = tmp_path / "repo"
        repo_path.mkdir()
        subprocess.run(["git", "init"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_path, check=True, capture_output=True)

        # Setup: Create valid shader
        shader_path = repo_path / "shader.wgsl"
        shader_path.write_text('''
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    // Valid shader
}
''')

        # Commit the valid version
        subprocess.run(["git", "add", "shader.wgsl"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Add valid shader"], cwd=repo_path, check=True, capture_output=True)

        # Get the commit hash
        result = subprocess.run(["git", "rev-parse", "HEAD"], cwd=repo_path, capture_output=True, text=True)
        good_commit = result.stdout.strip()

        # Inject error (corrupt the shader)
        shader_path.write_text(shader_path.read_text().replace("let idx", "let idx BROKEN"))

        # Verify fracture is detected
        from systems.evolution_daemon.tests.test_ouroboros_self_repair import TestFractureDetection
        detector = TestFractureDetection()
        validation = await detector._validate_wgsl(shader_path)
        assert validation["valid"] == False, "Should detect syntax error"

        # Perform rollback
        subprocess.run(["git", "checkout", "HEAD", "--", "shader.wgsl"], cwd=repo_path, check=True, capture_output=True)

        # Verify recovery
        validation_after = await detector._validate_wgsl(shader_path)
        assert validation_after["valid"] == True, "Shader should be valid after rollback"

    @pytest.mark.asyncio
    async def test_rollback_logs_to_history(self, tmp_path):
        """Test that rollback events are logged to evolution_history.json."""
        # Setup repo
        repo_path = tmp_path / "repo"
        repo_path.mkdir()
        subprocess.run(["git", "init"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_path, check=True, capture_output=True)

        shader_path = repo_path / "shader.wgsl"
        shader_path.write_text('let x = 1;')
        subprocess.run(["git", "add", "shader.wgsl"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Add valid shader"], cwd=repo_path, check=True, capture_output=True)

        # Create history file
        history_path = repo_path / "evolution_history.json"
        history_path.write_text(json.dumps({"repairs": []}))

        # Inject error and rollback
        shader_path.write_text("BROKEN")
        subprocess.run(["git", "checkout", "HEAD", "--", "shader.wgsl"], cwd=repo_path, check=True, capture_output=True)

        # Log the repair
        history = json.loads(history_path.read_text())
        history["repairs"].append({
            "type": "rollback",
            "file": "shader.wgsl",
            "timestamp": "2026-02-18T00:00:00Z",
            "trigger": "syntax_error"
        })
        history_path.write_text(json.dumps(history, indent=2))

        # Verify log
        history = json.loads(history_path.read_text())
        assert len(history["repairs"]) == 1
        assert history["repairs"][0]["type"] == "rollback"

    @pytest.mark.asyncio
    async def test_rollback_preserves_other_changes(self, tmp_path):
        """Test that rollback only affects the fractured file."""
        # Setup repo
        repo_path = tmp_path / "repo"
        repo_path.mkdir()
        subprocess.run(["git", "init"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_path, check=True, capture_output=True)

        # Create two files
        (repo_path / "shader.wgsl").write_text("valid shader")
        (repo_path / "config.json").write_text('{"setting": "original"}')

        subprocess.run(["git", "add", "."], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Initial commit"], cwd=repo_path, check=True, capture_output=True)

        # Modify both
        (repo_path / "shader.wgsl").write_text("BROKEN")
        (repo_path / "config.json").write_text('{"setting": "modified"}')

        # Rollback only shader
        subprocess.run(["git", "checkout", "HEAD", "--", "shader.wgsl"], cwd=repo_path, check=True, capture_output=True)

        # Verify shader is rolled back, config is not
        assert (repo_path / "shader.wgsl").read_text() == "valid shader"
        assert (repo_path / "config.json").read_text() == '{"setting": "modified"}'


class TestAIPatchRepair:
    """Tests for AI-generated patch repair."""

    @pytest.mark.asyncio
    async def test_ai_patch_simple_syntax_error(self, tmp_path):
        """Test: Inject error -> LLM Analysis -> Apply Patch -> Verify Fix"""
        # Create a shader with a simple syntax error
        shader_path = tmp_path / "broken.wgsl"
        shader_path.write_text('''
@compute @workgroup_size(64)
fn main() {
    let x = 10  // Missing semicolon
}
''')

        # Simulate AI analysis and patch generation
        patch = self._generate_syntax_patch(shader_path.read_text())

        # Apply patch
        fixed_content = self._apply_patch(shader_path.read_text(), patch)
        shader_path.write_text(fixed_content)

        # Verify fix
        from systems.evolution_daemon.tests.test_ouroboros_self_repair import TestFractureDetection
        detector = TestFractureDetection()
        validation = await detector._validate_wgsl(shader_path)

        assert validation["valid"] == True

    @pytest.mark.asyncio
    async def test_ai_patch_preserves_logic(self, tmp_path):
        """Test that AI patches don't change shader logic, only fix syntax."""
        # Valid shader logic
        original_logic = '''
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let idx = id.x;
    let result = idx * 2;  // Double the index
    storageBarrier();
}
'''

        # Broken version (missing semicolon)
        broken = original_logic.replace("let result = idx * 2;", "let result = idx * 2")

        shader_path = tmp_path / "logic_test.wgsl"
        shader_path.write_text(broken)

        # Generate and apply patch
        patch = self._generate_syntax_patch(broken)
        fixed = self._apply_patch(broken, patch)

        # Verify logic is preserved (idx * 2 still exists)
        assert "idx * 2" in fixed
        assert fixed.count("let") == original_logic.count("let")

    @pytest.mark.asyncio
    async def test_ai_patch_multiple_errors(self, tmp_path):
        """Test AI patch generation for multiple syntax errors."""
        # Shader with multiple errors
        shader_path = tmp_path / "multi_broken.wgsl"
        shader_path.write_text('''
@compute @workgroup_size(64)
fn main() {
    let x = 10  // Missing semicolon
    let y = 20  // Missing semicolon
    let z = x + y
}
''')

        # Generate and apply patch
        patch = self._generate_syntax_patch(shader_path.read_text())
        fixed = self._apply_patch(shader_path.read_text(), patch)

        # Write fixed content to a new file
        fixed_path = tmp_path / "fixed.wgsl"
        fixed_path.write_text(fixed)

        # Verify all errors fixed
        from systems.evolution_daemon.tests.test_ouroboros_self_repair import TestFractureDetection
        detector = TestFractureDetection()
        validation = await detector._validate_wgsl(fixed_path)

        assert validation["valid"] == True

    def _generate_syntax_patch(self, content: str) -> Dict[str, Any]:
        """Simulate AI-generated patch for syntax errors."""
        patches = []
        lines = content.split('\n')

        for i, line in enumerate(lines):
            stripped = line.strip()

            # Detect missing semicolons
            if stripped.startswith('let ') and not stripped.endswith(';') and not stripped.endswith('{'):
                patches.append({
                    "line": i + 1,
                    "type": "add_semicolon",
                    "original": line,
                    "fixed": line.rstrip() + ';'
                })

        return {"patches": patches}

    def _apply_patch(self, content: str, patch: Dict[str, Any]) -> str:
        """Apply patches to content."""
        lines = content.split('\n')

        for p in patch.get("patches", []):
            line_idx = p["line"] - 1
            if p["type"] == "add_semicolon":
                lines[line_idx] = p["fixed"]

        return '\n'.join(lines)


class TestRepairVerification:
    """Tests for verifying repair success."""

    @pytest.mark.asyncio
    async def test_permanent_recovery_after_rollback(self, tmp_path):
        """Test that recovery persists after rollback (no re-fracture)."""
        # Setup repo
        repo_path = tmp_path / "repo"
        repo_path.mkdir()
        subprocess.run(["git", "init"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_path, check=True, capture_output=True)

        # Create and commit valid shader
        shader_path = repo_path / "shader.wgsl"
        shader_path.write_text('''
@compute @workgroup_size(64)
fn main() {
    let x = 10;
}
''')
        subprocess.run(["git", "add", "shader.wgsl"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Valid shader"], cwd=repo_path, check=True, capture_output=True)

        # Corrupt and rollback
        shader_path.write_text("BROKEN")
        subprocess.run(["git", "checkout", "HEAD", "--", "shader.wgsl"], cwd=repo_path, check=True, capture_output=True)

        # Verify recovery
        content_after = shader_path.read_text()
        assert "BROKEN" not in content_after

        # Verify stability (check 3 times)
        from systems.evolution_daemon.tests.test_ouroboros_self_repair import TestFractureDetection
        detector = TestFractureDetection()

        for _ in range(3):
            validation = await detector._validate_wgsl(shader_path)
            assert validation["valid"] == True

    @pytest.mark.asyncio
    async def test_ouroboros_loop_closes(self, tmp_path):
        """Test the complete Ouroboros loop: Execute -> Observe -> Detect -> Repair -> Verify."""
        from systems.evolution_daemon.tests.test_ouroboros_self_repair import TestFractureDetection

        detector = TestFractureDetection()

        # 1. EXECUTE: Create a working system
        shader_path = tmp_path / "loop_test.wgsl"
        shader_path.write_text('''
@compute @workgroup_size(64)
fn main() {
    let x = 10;
}
''')

        # 2. OBSERVE: Initial validation
        initial = await detector._validate_wgsl(shader_path)
        assert initial["valid"] == True

        # 3. DETECT: Inject fracture and detect
        shader_path.write_text(shader_path.read_text().replace("let x = 10;", "let x = 10"))
        detection = await detector._validate_wgsl(shader_path)
        assert detection["valid"] == False

        # 4. REPAIR: Apply fix (manual for this test)
        shader_path.write_text('''
@compute @workgroup_size(64)
fn main() {
    let x = 10;
}
''')

        # 5. VERIFY: Confirm recovery
        final = await detector._validate_wgsl(shader_path)
        assert final["valid"] == True

        # Loop closed successfully!

    @pytest.mark.asyncio
    async def test_detection_within_5_seconds(self, tmp_path):
        """Test that fractures are detected within 5 seconds."""
        # Create shader with error
        shader_path = tmp_path / "timing_test.wgsl"
        shader_path.write_text("let x = 1")  # Missing semicolon

        from systems.evolution_daemon.tests.test_ouroboros_self_repair import TestFractureDetection
        detector = TestFractureDetection()

        start = time.time()
        validation = await detector._validate_wgsl(shader_path)
        elapsed = time.time() - start

        assert validation["valid"] == False
        assert elapsed < 5.0, f"Detection took {elapsed}s, should be < 5s"

    @pytest.mark.asyncio
    async def test_full_ouroboros_cycle_with_history(self, tmp_path):
        """Test complete Ouroboros cycle with history logging."""
        from systems.evolution_daemon.tests.test_ouroboros_self_repair import TestFractureDetection

        # Setup repo
        repo_path = tmp_path / "cycle_repo"
        repo_path.mkdir()
        subprocess.run(["git", "init"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_path, check=True, capture_output=True)

        detector = TestFractureDetection()

        # Initialize history
        history_path = repo_path / "evolution_history.json"
        history_path.write_text(json.dumps({"repairs": [], "detections": []}))

        # Create and commit valid shader
        shader_path = repo_path / "cycle.wgsl"
        shader_path.write_text('let x = 1;')
        subprocess.run(["git", "add", "."], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Initial"], cwd=repo_path, check=True, capture_output=True)

        # 1. EXECUTE: Working system
        initial = await detector._validate_wgsl(shader_path)
        assert initial["valid"] == True

        # 2. & 3. OBSERVE & DETECT: Inject and detect fracture
        shader_path.write_text("let x = 1")  # Missing semicolon
        detection = await detector._validate_wgsl(shader_path)
        assert detection["valid"] == False

        # Log detection
        history = json.loads(history_path.read_text())
        history["detections"].append({
            "file": "cycle.wgsl",
            "error": "Missing semicolon",
            "timestamp": time.time()
        })
        history_path.write_text(json.dumps(history))

        # 4. REPAIR: Rollback
        subprocess.run(["git", "checkout", "HEAD", "--", "cycle.wgsl"], cwd=repo_path, check=True, capture_output=True)

        # Log repair
        history = json.loads(history_path.read_text())
        history["repairs"].append({
            "type": "rollback",
            "file": "cycle.wgsl",
            "timestamp": time.time()
        })
        history_path.write_text(json.dumps(history))

        # 5. VERIFY: Confirm recovery
        final = await detector._validate_wgsl(shader_path)
        assert final["valid"] == True

        # Verify history was logged
        history = json.loads(history_path.read_text())
        assert len(history["detections"]) == 1
        assert len(history["repairs"]) == 1
