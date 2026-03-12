#!/usr/bin/env python3
"""
GlyphStratum Integration Tests

End-to-end tests for the complete GlyphStratum toolchain.
Tests parser → CLI → validation → export workflows.
"""
import unittest
import subprocess
import json
import os
import sys
import tempfile
from pathlib import Path

# Add parent to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))


class TestPythonParser(unittest.TestCase):
    """Test Python to GlyphStratum parser."""

    def run_parser(self, code: str) -> dict:
        """Run parser on code string and return result."""
        result = subprocess.run(
            ['python3', 'python_parser.py', '-c', code],
            capture_output=True, text=True
        )
        self.assertEqual(result.returncode, 0, f"Parser failed: {result.stderr}")
        return json.loads(result.stdout)

    def test_simple_function(self):
        """Test parsing simple function."""
        data = self.run_parser("def add(a, b): return a + b")
        self.assertIn('glyphs', data)
        self.assertGreaterEqual(len(data['glyphs']), 5)

        # Check for INTENT glyph
        has_intent = any(g['stratum'] == 'INTENT' for g in data['glyphs'].values())
        self.assertTrue(has_intent, "Should have INTENT glyph")

    def test_recursive_function(self):
        """Test parsing recursive function."""
        data = self.run_parser("def fib(n): return n if n <= 1 else fib(n-1) + fib(n-2)")
        self.assertGreaterEqual(len(data['glyphs']), 10)

    def test_for_loop(self):
        """Test parsing for loop."""
        code = """
def sum_array(arr):
    total = 0
    for x in arr:
        total = total + x
    return total
"""
        data = self.run_parser(code)
        self.assertGreaterEqual(len(data['glyphs']), 8)

        # Check for LOOP opcode
        has_loop = any(g['opcode'] == 'LOOP' for g in data['glyphs'].values())
        self.assertTrue(has_loop, "Should have LOOP glyph")

    def test_class_definition(self):
        """Test parsing class definition."""
        data = self.run_parser("class Point: pass")
        self.assertGreaterEqual(len(data['glyphs']), 2)

        # Check for TYPE opcode
        has_type = any(g['opcode'] == 'TYPE' for g in data['glyphs'].values())
        self.assertTrue(has_type, "Should have TYPE glyph")


class TestCLI(unittest.TestCase):
    """Test CLI commands."""

    def run_cli(self, *args) -> subprocess.CompletedProcess:
        """Run CLI command and return result."""
        return subprocess.run(
            ['python3', 'glyph_cli.py'] + list(args),
            capture_output=True, text=True
        )

    def test_new_command(self):
        """Test creating new program."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False) as f:
            try:
                result = self.run_cli('new', 'test_program', '-o', f.name)
                self.assertEqual(result.returncode, 0)

                with open(f.name) as fp:
                    data = json.load(fp)

                self.assertEqual(data['name'], 'test_program')
                self.assertIn('glyphs', data)
            finally:
                os.unlink(f.name)

    def test_validate_valid(self):
        """Test validating valid program."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump({
                'name': 'test',
                'glyphs': {
                    '0': {'stratum': 'SUBSTRATE', 'opcode': 'DATA', 'dependencies': []},
                    '1': {'stratum': 'INTENT', 'opcode': 'MODULE', 'dependencies': [0]}
                }
            }, f)
            f.flush()

            try:
                result = self.run_cli('validate', f.name)
                self.assertIn('✓', result.stdout)
            finally:
                os.unlink(f.name)

    def test_validate_invalid(self):
        """Test validating invalid program."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump({
                'name': 'test',
                'glyphs': {
                    '0': {'stratum': 'INTENT', 'opcode': 'MODULE', 'dependencies': []},
                    '1': {'stratum': 'SUBSTRATE', 'opcode': 'DATA', 'dependencies': [0]}  # Invalid!
                }
            }, f)
            f.flush()

            try:
                result = self.run_cli('validate', f.name)
                self.assertIn('✗', result.stdout)
            finally:
                os.unlink(f.name)

    def test_samples_command(self):
        """Test listing samples."""
        result = self.run_cli('samples')
        self.assertEqual(result.returncode, 0)
        self.assertIn('add_two_numbers', result.stdout)

    def test_export_dot(self):
        """Test exporting to DOT format."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump({
                'name': 'test',
                'glyphs': {
                    '0': {'stratum': 'SUBSTRATE', 'opcode': 'DATA', 'dependencies': []},
                    '1': {'stratum': 'INTENT', 'opcode': 'MODULE', 'dependencies': [0]}
                }
            }, f)
            f.flush()

            try:
                result = self.run_cli('export', f.name, 'dot')
                self.assertIn('digraph', result.stdout)
                self.assertIn('->', result.stdout)
            finally:
                os.unlink(f.name)

    def test_export_mermaid(self):
        """Test exporting to Mermaid format."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump({
                'name': 'test',
                'glyphs': {
                    '0': {'stratum': 'SUBSTRATE', 'opcode': 'DATA', 'dependencies': []},
                    '1': {'stratum': 'INTENT', 'opcode': 'MODULE', 'dependencies': [0]}
                }
            }, f)
            f.flush()

            try:
                result = self.run_cli('export', f.name, 'mermaid')
                self.assertIn('graph', result.stdout)
                self.assertIn('-->', result.stdout)
            finally:
                os.unlink(f.name)

    def test_info_command(self):
        """Test info command."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump({
                'name': 'test_program',
                'glyphs': {
                    '0': {'stratum': 'SUBSTRATE', 'opcode': 'DATA', 'dependencies': [], 'rationale': 'test'},
                    '1': {'stratum': 'INTENT', 'opcode': 'MODULE', 'dependencies': [0], 'rationale': 'intent'}
                }
            }, f)
            f.flush()

            try:
                result = self.run_cli('info', f.name)
                self.assertIn('test_program', result.stdout)
                self.assertIn('Coherence', result.stdout)
            finally:
                os.unlink(f.name)

    def test_generate_command(self):
        """Test generate command."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False) as f:
            try:
                result = self.run_cli('generate', 'test_add', 'add two numbers', '-o', f.name)
                self.assertEqual(result.returncode, 0)

                with open(f.name) as fp:
                    data = json.load(fp)

                self.assertGreater(len(data['glyphs']), 0)
            finally:
                os.unlink(f.name)


class TestCoherence(unittest.TestCase):
    """Test strata coherence validation."""

    def calculate_coherence(self, glyphs: dict) -> float:
        """Calculate coherence percentage."""
        STRATUM_ORDER = {'SUBSTRATE': 0, 'MEMORY': 1, 'LOGIC': 2, 'SPEC': 3, 'INTENT': 4}

        valid, total = 0, 0
        for glyph in glyphs.values():
            for dep in glyph.get('dependencies', []):
                total += 1
                dep_str = str(dep)
                if dep_str in glyphs:
                    dep_stratum = glyphs[dep_str]['stratum']
                    if STRATUM_ORDER.get(dep_stratum, 0) <= STRATUM_ORDER.get(glyph['stratum'], 0):
                        valid += 1

        return (valid / total * 100) if total > 0 else 100

    def test_valid_coherence(self):
        """Test valid strata ordering."""
        glyphs = {
            '0': {'stratum': 'SUBSTRATE', 'dependencies': []},
            '1': {'stratum': 'MEMORY', 'dependencies': [0]},
            '2': {'stratum': 'LOGIC', 'dependencies': [1]},
            '3': {'stratum': 'SPEC', 'dependencies': [2]},
            '4': {'stratum': 'INTENT', 'dependencies': [3]}
        }
        self.assertEqual(self.calculate_coherence(glyphs), 100)

    def test_invalid_coherence(self):
        """Test invalid strata ordering."""
        glyphs = {
            '0': {'stratum': 'INTENT', 'dependencies': []},
            '1': {'stratum': 'SUBSTRATE', 'dependencies': [0]}  # Invalid!
        }
        self.assertLess(self.calculate_coherence(glyphs), 100)

    def test_sample_programs_coherence(self):
        """Test all sample programs have 100% coherence."""
        samples_file = Path(__file__).parent / 'sample_programs_loader.json'
        if not samples_file.exists():
            self.skipTest("Sample programs file not found")

        with open(samples_file) as f:
            data = json.load(f)

        for name, sample in data.get('samples', {}).items():
            coherence = self.calculate_coherence(sample.get('glyphs', {}))
            self.assertEqual(coherence, 100, f"Sample '{name}' has {coherence}% coherence")


class TestRoundTrip(unittest.TestCase):
    """Test round-trip workflows."""

    def test_parser_to_cli_roundtrip(self):
        """Test parser output works with CLI."""
        # Parse Python code
        result = subprocess.run(
            ['python3', 'python_parser.py', '-c', 'def add(a, b): return a + b'],
            capture_output=True, text=True
        )
        self.assertEqual(result.returncode, 0)

        # Save to temp file
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            f.write(result.stdout)
            f.flush()

            try:
                # Validate with CLI
                val_result = subprocess.run(
                    ['python3', 'glyph_cli.py', 'validate', f.name],
                    capture_output=True, text=True
                )
                self.assertIn('✓', val_result.stdout)
                self.assertIn('100.0%', val_result.stdout)
            finally:
                os.unlink(f.name)

    def test_json_roundtrip(self):
        """Test JSON export/import preserves data."""
        original = {
            'name': 'test',
            'glyphs': {
                '0': {'stratum': 'SUBSTRATE', 'opcode': 'DATA', 'rationale': 'test', 'dependencies': []},
                '1': {'stratum': 'INTENT', 'opcode': 'MODULE', 'rationale': 'intent', 'dependencies': [0]}
            }
        }

        # Write and read back
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump(original, f)
            f.flush()

            try:
                with open(f.name) as fp:
                    reloaded = json.load(fp)

                self.assertEqual(original['name'], reloaded['name'])
                self.assertEqual(len(original['glyphs']), len(reloaded['glyphs']))
            finally:
                os.unlink(f.name)


class TestEdgeCases(unittest.TestCase):
    """Test edge cases and error handling."""

    def test_empty_program(self):
        """Test handling empty program."""
        data = {'name': 'empty', 'glyphs': {}}
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump(data, f)
            f.flush()

            try:
                result = subprocess.run(
                    ['python3', 'glyph_cli.py', 'validate', f.name],
                    capture_output=True, text=True
                )
                # Empty program should be valid
                self.assertIn('✓', result.stdout)
            finally:
                os.unlink(f.name)

    def test_missing_intent(self):
        """Test program without INTENT glyph."""
        data = {
            'name': 'no_intent',
            'glyphs': {
                '0': {'stratum': 'SUBSTRATE', 'opcode': 'DATA', 'dependencies': []},
                '1': {'stratum': 'LOGIC', 'opcode': 'CALL', 'dependencies': [0]}
            }
        }
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump(data, f)
            f.flush()

            try:
                result = subprocess.run(
                    ['python3', 'glyph_cli.py', 'validate', f.name],
                    capture_output=True, text=True
                )
                # Should warn about missing INTENT
                self.assertIn('✗', result.stdout)
            finally:
                os.unlink(f.name)

    def test_missing_dependency(self):
        """Test program with missing dependency."""
        data = {
            'name': 'broken',
            'glyphs': {
                '0': {'stratum': 'LOGIC', 'opcode': 'CALL', 'dependencies': [99]}  # Missing!
            }
        }
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump(data, f)
            f.flush()

            try:
                result = subprocess.run(
                    ['python3', 'glyph_cli.py', 'validate', f.name],
                    capture_output=True, text=True
                )
                # Should detect missing dependency
                self.assertIn('✗', result.stdout)
            finally:
                os.unlink(f.name)

    def test_string_dependencies(self):
        """Test handling string dependency IDs."""
        data = {
            'name': 'string_deps',
            'glyphs': {
                '0': {'stratum': 'SUBSTRATE', 'opcode': 'DATA', 'dependencies': []},
                '1': {'stratum': 'INTENT', 'opcode': 'MODULE', 'dependencies': ['0']}  # String!
            }
        }
        # Parser and CLI should handle string dependencies
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump(data, f)
            f.flush()

            try:
                result = subprocess.run(
                    ['python3', 'glyph_cli.py', 'validate', f.name],
                    capture_output=True, text=True
                )
                # Should handle string deps
                self.assertIn('✓', result.stdout)
            finally:
                os.unlink(f.name)

    def test_large_program(self):
        """Test handling large program (50+ glyphs)."""
        glyphs = {}
        for i in range(50):
            stratum = ['SUBSTRATE', 'MEMORY', 'LOGIC', 'SPEC', 'INTENT'][min(i // 10, 4)]
            deps = [i - 1] if i > 0 else []
            glyphs[str(i)] = {
                'stratum': stratum,
                'opcode': 'DATA' if i == 0 else 'CALL',
                'dependencies': deps
            }

        data = {'name': 'large', 'glyphs': glyphs}
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            json.dump(data, f)
            f.flush()

            try:
                result = subprocess.run(
                    ['python3', 'glyph_cli.py', 'validate', f.name],
                    capture_output=True, text=True
                )
                self.assertIn('✓', result.stdout)
                self.assertIn('100.0%', result.stdout)
            finally:
                os.unlink(f.name)


class TestIntegration(unittest.TestCase):
    """Full integration tests across all tools."""

    def test_full_workflow(self):
        """Test complete workflow: parse → validate → export."""
        code = """
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)
"""

        with tempfile.TemporaryDirectory() as tmpdir:
            parsed_file = Path(tmpdir) / 'parsed.json'
            dot_file = Path(tmpdir) / 'graph.dot'
            mermaid_file = Path(tmpdir) / 'graph.mmd'

            # Step 1: Parse Python
            result = subprocess.run(
                ['python3', 'python_parser.py', '-c', code, '-o', str(parsed_file)],
                capture_output=True, text=True
            )
            self.assertEqual(result.returncode, 0)
            self.assertTrue(parsed_file.exists())

            # Step 2: Validate
            result = subprocess.run(
                ['python3', 'glyph_cli.py', 'validate', str(parsed_file)],
                capture_output=True, text=True
            )
            self.assertIn('✓', result.stdout)
            self.assertIn('100.0%', result.stdout)

            # Step 3: Get info
            result = subprocess.run(
                ['python3', 'glyph_cli.py', 'info', str(parsed_file)],
                capture_output=True, text=True
            )
            self.assertIn('Coherence', result.stdout)  # Verify info command works

            # Step 4: Export to DOT
            result = subprocess.run(
                ['python3', 'glyph_cli.py', 'export', str(parsed_file), 'dot', '-o', str(dot_file)],
                capture_output=True, text=True
            )
            self.assertTrue(dot_file.exists())
            content = dot_file.read_text()
            self.assertIn('digraph', content)

            # Step 5: Export to Mermaid
            result = subprocess.run(
                ['python3', 'glyph_cli.py', 'export', str(parsed_file), 'mermaid', '-o', str(mermaid_file)],
                capture_output=True, text=True
            )
            self.assertTrue(mermaid_file.exists())
            content = mermaid_file.read_text()
            self.assertIn('graph', content)


if __name__ == '__main__':
    # Run tests
    unittest.main(verbosity=2)
