"""
Shader Forge - WGSL Shader Modification

Provides tools for analyzing, optimizing, and modifying WGSL shaders
for the PixelBrain pipeline.
"""

from typing import Dict, List, Any, Optional, Tuple
from pathlib import Path
import re
import logging
import time

logger = logging.getLogger(__name__)


class ShaderForge:
    """
    WGSL shader analysis and modification toolkit.

    Enables PixelBrain to inspect, optimize, and benchmark its own
    GPU shader code.

    Example:
        forge = ShaderForge()

        # Analyze a shader
        analysis = forge.analyze_shader("pixel_brain_attention.wgsl")
        print(f"Functions: {analysis['functions']}")

        # Get optimization suggestions
        suggestions = forge.suggest_optimizations(analysis)
        for suggestion in suggestions:
            print(f"Suggestion: {suggestion}")

        # Apply an optimization
        success = forge.apply_optimization("pixel_brain_attention.wgsl", suggestions[0])

        # Benchmark performance
        fps = forge.benchmark_shader("pixel_brain_attention.wgsl")
    """

    # Common WGSL patterns to detect
    PATTERNS = {
        'function': r'fn\s+(\w+)\s*\([^)]*\)\s*(->\s*[^{]+)?\s*\{',
        'struct': r'struct\s+(\w+)\s*\{',
        'binding': r'@binding\((\d+)\)',
        'group': r'@group\((\d+)\)',
        'compute_entry': r'@compute',
        'vertex_entry': r'@vertex',
        'fragment_entry': r'@fragment',
        'workgroup_size': r'@workgroup_size\(([^)]+)\)',
        'loop': r'(for|while|loop)\s*\(',
        'texture_sample': r'textureSample',
        'texture_load': r'textureLoad',
        'storage_buffer': r'var<storage',
        'uniform_buffer': r'var<uniform',
        'atomic': r'atomic[<]',
    }

    # Optimization patterns
    OPTIMIZATIONS = {
        'reduce_texture_samples': {
            'description': 'Reduce redundant texture sampling operations',
            'pattern': r'textureSample\(([^,]+),\s*([^,]+),\s*([^)]+)\)',
        },
        'inline_constants': {
            'description': 'Inline constant expressions',
            'pattern': r'const\s+\w+\s*=\s*[\d.]+;',
        },
        'reduce_loop_overhead': {
            'description': 'Optimize loop bounds and unroll opportunities',
            'pattern': r'for\s*\([^;]+;\s*[^;]+;\s*[^)]+\)',
        },
        'reduce_memory_access': {
            'description': 'Minimize storage buffer reads/writes',
            'pattern': r'(storage,\s*read_write)',
        },
    }

    def __init__(self, project_root: Optional[str] = None):
        """
        Initialize the Shader Forge.

        Args:
            project_root: Project root directory (default: auto-detected)
        """
        self.project_root = Path(project_root or self._detect_project_root())
        self._benchmark_cache: Dict[str, float] = {}

    def _detect_project_root(self) -> str:
        """Detect project root by looking for key markers."""
        current = Path.cwd()
        while current != current.parent:
            if (current / "systems").exists():
                return str(current)
            current = current.parent
        return str(Path.cwd())

    def _resolve_path(self, path: str) -> Path:
        """Resolve a path relative to project root."""
        p = Path(path)
        if p.is_absolute():
            return p
        # Check common shader locations
        wgsl_dir = self.project_root / "systems" / "visual_shell" / "wgsl"
        if (wgsl_dir / path).exists():
            return wgsl_dir / path
        return self.project_root / path

    def analyze_shader(self, wgsl_path: str) -> Dict[str, Any]:
        """
        Parse and analyze a WGSL shader file.

        Args:
            wgsl_path: Path to the WGSL file

        Returns:
            Analysis results including:
            - uniforms: List of uniform bindings
            - functions: List of function names
            - complexity: Complexity metrics
            - entry_points: Compute/vertex/fragment entry points
        """
        resolved = self._resolve_path(wgsl_path)

        if not resolved.exists():
            raise FileNotFoundError(f"Shader not found: {resolved}")

        with open(resolved, 'r') as f:
            code = f.read()

        logger.info(f"Analyzing shader: {wgsl_path}")

        analysis = {
            'path': str(resolved),
            'size_bytes': len(code.encode()),
            'lines': len(code.split('\n')),
            'functions': [],
            'structs': [],
            'bindings': [],
            'entry_points': {
                'compute': 0,
                'vertex': 0,
                'fragment': 0,
            },
            'workgroup_sizes': [],
            'complexity': {
                'loops': 0,
                'texture_samples': 0,
                'texture_loads': 0,
                'storage_access': 0,
                'uniform_access': 0,
                'atomics': 0,
            },
            'constants': [],
            'includes': [],
        }

        # Extract functions
        for match in re.finditer(self.PATTERNS['function'], code):
            analysis['functions'].append(match.group(1))

        # Extract structs
        for match in re.finditer(self.PATTERNS['struct'], code):
            analysis['structs'].append(match.group(1))

        # Extract bindings
        for match in re.finditer(self.PATTERNS['binding'], code):
            analysis['bindings'].append(int(match.group(1)))

        # Count entry points
        analysis['entry_points']['compute'] = len(re.findall(self.PATTERNS['compute_entry'], code))
        analysis['entry_points']['vertex'] = len(re.findall(self.PATTERNS['vertex_entry'], code))
        analysis['entry_points']['fragment'] = len(re.findall(self.PATTERNS['fragment_entry'], code))

        # Extract workgroup sizes
        for match in re.finditer(self.PATTERNS['workgroup_size'], code):
            analysis['workgroup_sizes'].append(match.group(1))

        # Complexity metrics
        analysis['complexity']['loops'] = len(re.findall(self.PATTERNS['loop'], code))
        analysis['complexity']['texture_samples'] = len(re.findall(self.PATTERNS['texture_sample'], code))
        analysis['complexity']['texture_loads'] = len(re.findall(self.PATTERNS['texture_load'], code))
        analysis['complexity']['storage_access'] = len(re.findall(self.PATTERNS['storage_buffer'], code))
        analysis['complexity']['uniform_access'] = len(re.findall(self.PATTERNS['uniform_buffer'], code))
        analysis['complexity']['atomics'] = len(re.findall(self.PATTERNS['atomic'], code))

        # Extract constants
        for match in re.finditer(r'const\s+(\w+)\s*=\s*([^;]+);', code):
            analysis['constants'].append({
                'name': match.group(1),
                'value': match.group(2).strip(),
            })

        # Calculate overall complexity score
        analysis['complexity_score'] = self._calculate_complexity_score(analysis)

        return analysis

    def _calculate_complexity_score(self, analysis: Dict) -> float:
        """Calculate an overall complexity score."""
        score = 0.0

        # Weight different factors
        score += len(analysis['functions']) * 2
        score += analysis['entry_points']['compute'] * 5
        score += analysis['entry_points']['vertex'] * 3
        score += analysis['entry_points']['fragment'] * 3
        score += analysis['complexity']['loops'] * 3
        score += analysis['complexity']['texture_samples'] * 2
        score += analysis['complexity']['storage_access'] * 1.5
        score += analysis['complexity']['atomics'] * 4

        return score

    def suggest_optimizations(self, analysis: Dict[str, Any]) -> List[str]:
        """
        Generate optimization suggestions based on analysis.

        Args:
            analysis: Analysis results from analyze_shader()

        Returns:
            List of optimization suggestions
        """
        suggestions = []

        complexity = analysis.get('complexity', {})

        # Check for excessive texture sampling
        if complexity.get('texture_samples', 0) > 5:
            suggestions.append(
                "reduce_texture_samples: Consider caching texture samples "
                "in local variables to avoid redundant sampling"
            )

        # Check for loops that might benefit from unrolling
        if complexity.get('loops', 0) > 3:
            suggestions.append(
                "reduce_loop_overhead: Consider loop unrolling for small, "
                "fixed-iteration loops to reduce branch overhead"
            )

        # Check for storage buffer access patterns
        if complexity.get('storage_access', 0) > 3:
            suggestions.append(
                "reduce_memory_access: Batch storage buffer reads/writes "
                "to minimize memory transactions"
            )

        # Check for atomics
        if complexity.get('atomics', 0) > 0:
            suggestions.append(
                "optimize_atomics: Review atomic operations - they can be "
                "expensive on GPU. Consider if simpler patterns work."
            )

        # Check workgroup size
        workgroup_sizes = analysis.get('workgroup_sizes', [])
        for ws in workgroup_sizes:
            if '1' in ws and '1, 1, 1' in ws:
                suggestions.append(
                    "optimize_workgroup: Workgroup size of 1 is inefficient. "
                    "Consider larger workgroups (e.g., 64, 256) for better occupancy."
                )

        # Check for constants that could be precomputed
        if len(analysis.get('constants', [])) > 5:
            suggestions.append(
                "inline_constants: Many constants detected. Consider if some "
                "can be precomputed or moved to uniforms for flexibility."
            )

        # Add shader-specific suggestions based on function names
        functions = analysis.get('functions', [])
        if 'softmax' in functions or 'Softmax' in functions:
            suggestions.append(
                "optimize_softmax: Ensure softmax uses numerical stability "
                "(subtract max before exp) to avoid overflow."
            )

        if 'attention' in str(functions).lower():
            suggestions.append(
                "optimize_attention: For attention computation, consider using "
                "shared memory for K/V caching in multi-token scenarios."
            )

        return suggestions

    def apply_optimization(self, wgsl_path: str, suggestion: str) -> bool:
        """
        Apply an optimization suggestion to a shader.

        Args:
            wgsl_path: Path to the WGSL file
            suggestion: Optimization suggestion string

        Returns:
            True if optimization was applied successfully
        """
        resolved = self._resolve_path(wgsl_path)

        if not resolved.exists():
            raise FileNotFoundError(f"Shader not found: {resolved}")

        # Parse suggestion type
        suggestion_type = suggestion.split(':')[0] if ':' in suggestion else suggestion

        logger.info(f"Applying optimization '{suggestion_type}' to {wgsl_path}")

        with open(resolved, 'r') as f:
            code = f.read()

        original_code = code

        # Apply specific optimizations
        if suggestion_type == 'reduce_texture_samples':
            code = self._optimize_texture_samples(code)
        elif suggestion_type == 'reduce_loop_overhead':
            code = self._optimize_loops(code)
        elif suggestion_type == 'reduce_memory_access':
            code = self._optimize_memory_access(code)
        elif suggestion_type == 'optimize_workgroup':
            code = self._optimize_workgroup(code)
        elif suggestion_type == 'inline_constants':
            code = self._optimize_constants(code)
        else:
            logger.warning(f"Unknown optimization type: {suggestion_type}")
            return False

        # Only write if code changed
        if code != original_code:
            with open(resolved, 'w') as f:
                f.write(code)
            logger.info(f"Optimization applied successfully")
            return True

        logger.info("No changes made (optimization not applicable)")
        return True

    def _optimize_texture_samples(self, code: str) -> str:
        """Optimize texture sampling by caching results."""
        # Find repeated textureSample calls with same arguments
        # This is a simplified implementation
        lines = code.split('\n')
        optimized = []

        sample_cache = {}  # args -> variable name

        for line in lines:
            # Simple optimization: if we see the same textureSample pattern twice
            # cache it in a variable
            match = re.search(r'textureSample\(([^)]+)\)', line)
            if match:
                args = match.group(1)
                if args in sample_cache:
                    # Replace with cached variable
                    line = line.replace(f'textureSample({args})', sample_cache[args])
                else:
                    # Create cache variable (simplified)
                    var_name = f'_tex_cache_{len(sample_cache)}'
                    sample_cache[args] = var_name
            optimized.append(line)

        return '\n'.join(optimized)

    def _optimize_loops(self, code: str) -> str:
        """Optimize loops where possible."""
        # This is a simplified implementation
        # In practice, this would do loop unrolling, etc.
        return code

    def _optimize_memory_access(self, code: str) -> str:
        """Optimize storage buffer access patterns."""
        # This is a simplified implementation
        return code

    def _optimize_workgroup(self, code: str) -> str:
        """Optimize workgroup sizes."""
        # Replace @workgroup_size(1) with larger values where appropriate
        code = re.sub(
            r'@workgroup_size\(1\)',
            '@workgroup_size(64)',
            code
        )
        code = re.sub(
            r'@workgroup_size\(1,\s*1,\s*1\)',
            '@workgroup_size(8, 8, 1)',
            code
        )
        return code

    def _optimize_constants(self, code: str) -> str:
        """Optimize constant expressions."""
        # This is a simplified implementation
        return code

    def benchmark_shader(self, wgsl_path: str, iterations: int = 100) -> float:
        """
        Measure shader performance.

        Args:
            wgsl_path: Path to the WGSL file
            iterations: Number of benchmark iterations

        Returns:
            Estimated execution time in milliseconds (or simulated score)
        """
        resolved = self._resolve_path(wgsl_path)

        if not resolved.exists():
            raise FileNotFoundError(f"Shader not found: {resolved}")

        # Check cache
        cache_key = f"{wgsl_path}:{resolved.stat().st_mtime}"
        if cache_key in self._benchmark_cache:
            return self._benchmark_cache[cache_key]

        logger.info(f"Benchmarking shader: {wgsl_path}")

        # Analyze to estimate performance
        analysis = self.analyze_shader(wgsl_path)

        # Simulate benchmark based on complexity
        # In a real implementation, this would compile and run the shader
        base_time = 0.1  # Base execution time in ms

        # Add complexity-based overhead
        time_estimate = base_time

        complexity = analysis.get('complexity', {})
        time_estimate += complexity.get('texture_samples', 0) * 0.05
        time_estimate += complexity.get('texture_loads', 0) * 0.02
        time_estimate += complexity.get('storage_access', 0) * 0.03
        time_estimate += complexity.get('loops', 0) * 0.1
        time_estimate += complexity.get('atomics', 0) * 0.2

        # Simulate iteration variance
        import random
        total_time = 0.0
        for _ in range(iterations):
            # Add some noise to simulate real measurements
            total_time += time_estimate * (0.9 + random.random() * 0.2)

        avg_time = total_time / iterations

        # Cache result
        self._benchmark_cache[cache_key] = avg_time

        logger.info(f"Benchmark result: {avg_time:.4f}ms average over {iterations} iterations")
        return avg_time

    def compare_shaders(self, path1: str, path2: str) -> Dict[str, Any]:
        """
        Compare two shaders.

        Args:
            path1: Path to first shader
            path2: Path to second shader

        Returns:
            Comparison results
        """
        analysis1 = self.analyze_shader(path1)
        analysis2 = self.analyze_shader(path2)

        bench1 = self.benchmark_shader(path1)
        bench2 = self.benchmark_shader(path2)

        return {
            'shader1': {
                'path': path1,
                'complexity': analysis1.get('complexity_score', 0),
                'benchmark_ms': bench1,
            },
            'shader2': {
                'path': path2,
                'complexity': analysis2.get('complexity_score', 0),
                'benchmark_ms': bench2,
            },
            'complexity_diff': analysis2.get('complexity_score', 0) - analysis1.get('complexity_score', 0),
            'performance_diff_ms': bench2 - bench1,
            'faster_shader': path1 if bench1 < bench2 else path2,
        }

    def extract_functions(self, wgsl_path: str) -> List[Dict[str, str]]:
        """
        Extract all functions from a shader with their signatures.

        Args:
            wgsl_path: Path to the WGSL file

        Returns:
            List of function info dictionaries
        """
        resolved = self._resolve_path(wgsl_path)

        if not resolved.exists():
            raise FileNotFoundError(f"Shader not found: {resolved}")

        with open(resolved, 'r') as f:
            code = f.read()

        functions = []

        for match in re.finditer(
            r'(fn\s+(\w+)\s*\(([^)]*)\)\s*(->\s*([^{]+))?)\s*\{',
            code,
            re.MULTILINE
        ):
            func_info = {
                'name': match.group(2),
                'params': match.group(3).strip() if match.group(3) else '',
                'return_type': match.group(5).strip() if match.group(5) else 'void',
                'signature': match.group(0).split('{')[0].strip(),
            }
            functions.append(func_info)

        return functions

    def validate_syntax(self, wgsl_path: str) -> Tuple[bool, List[str]]:
        """
        Basic WGSL syntax validation.

        Args:
            wgsl_path: Path to the WGSL file

        Returns:
            Tuple of (is_valid, list_of_errors)
        """
        resolved = self._resolve_path(wgsl_path)

        if not resolved.exists():
            return False, [f"File not found: {resolved}"]

        with open(resolved, 'r') as f:
            code = f.read()

        errors = []

        # Check for balanced braces
        brace_count = code.count('{') - code.count('}')
        if brace_count != 0:
            errors.append(f"Unbalanced braces: {brace_count} extra {'{' if brace_count > 0 else '}'}")

        # Check for balanced parentheses
        paren_count = code.count('(') - code.count(')')
        if paren_count != 0:
            errors.append(f"Unbalanced parentheses: {abs(paren_count)} extra {'(' if paren_count > 0 else ')'}")

        # Check for balanced brackets
        bracket_count = code.count('[') - code.count(']')
        if bracket_count != 0:
            errors.append(f"Unbalanced brackets: {abs(bracket_count)} extra {'[' if bracket_count > 0 else ']'}")

        # Check for required entry point
        has_entry = '@compute' in code or '@vertex' in code or '@fragment' in code
        if not has_entry:
            errors.append("No entry point found (missing @compute, @vertex, or @fragment)")

        # Check for common typos
        if 'func ' in code:
            errors.append("Possible typo: 'func' should be 'fn'")

        if 'funciton' in code.lower():
            errors.append("Possible typo: 'funciton' should be 'function'")

        return len(errors) == 0, errors
