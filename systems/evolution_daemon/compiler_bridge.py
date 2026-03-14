"""
Compiler Bridge - Connects Python evolution daemon to Rust glyph_compiler.

Provides subprocess-based compilation of glyph programs to SPIR-V.
"""

import subprocess
import json
from pathlib import Path
from typing import Dict, Any, Optional
from dataclasses import dataclass

from .glyph_evolution import GlyphProgram


@dataclass
class CompileResult:
    """Result of compiling a glyph program."""
    success: bool
    spirv_size: int
    word_count: int
    magic: Optional[str]
    error: Optional[str]


def find_compiler() -> Optional[Path]:
    """Find the glyph_compiler binary."""
    # Check for debug build
    debug_path = Path(__file__).parent.parent.parent.parent / "target" / "debug" / "glyph_compiler"
    if debug_path.exists():
        return debug_path

    # Check for release build
    release_path = Path(__file__).parent.parent.parent.parent / "target" / "release" / "glyph_compiler"
    if release_path.exists():
        return release_path

    return None


def compile_glyph_program(
    program: GlyphProgram,
    timeout: float = 30.0,
    compiler_path: Optional[Path] = None,
) -> CompileResult:
    """
    Compile a glyph program to SPIR-V.

    Args:
        program: The glyph program to compile
        timeout: Compilation timeout in seconds
        compiler_path: Optional path to compiler binary

    Returns:
        CompileResult with success status and metadata
    """
    if compiler_path is None:
        compiler_path = find_compiler()

    if compiler_path is None:
        return CompileResult(
            success=False,
            spirv_size=0,
            word_count=0,
            magic=None,
            error="glyph_compiler not found. Run: cargo build --package glyph_compiler",
        )

    try:
        result = subprocess.run(
            [str(compiler_path), "compile"],
            input=program.to_json(),
            capture_output=True,
            text=True,
            timeout=timeout,
        )

        if result.returncode != 0:
            return CompileResult(
                success=False,
                spirv_size=0,
                word_count=0,
                magic=None,
                error=result.stderr or "Compilation failed",
            )

        output = json.loads(result.stdout)
        return CompileResult(
            success=True,
            spirv_size=output.get("spirv_size", 0),
            word_count=output.get("word_count", 0),
            magic=output.get("magic"),
            error=None,
        )

    except subprocess.TimeoutExpired:
        return CompileResult(
            success=False,
            spirv_size=0,
            word_count=0,
            magic=None,
            error="Compilation timeout",
        )
    except json.JSONDecodeError as e:
        return CompileResult(
            success=False,
            spirv_size=0,
            word_count=0,
            magic=None,
            error=f"Invalid compiler output: {e}",
        )
    except Exception as e:
        return CompileResult(
            success=False,
            spirv_size=0,
            word_count=0,
            magic=None,
            error=str(e),
        )


def compile_and_score(
    program: GlyphProgram,
    fitness_fn=None,
) -> tuple[CompileResult, float]:
    """
    Compile a program and calculate its fitness.

    Args:
        program: The glyph program to compile and score
        fitness_fn: Optional fitness function (default: fitness_shader_correctness)

    Returns:
        (CompileResult, fitness_score)
    """
    from .glyph_evolution import fitness_shader_correctness

    if fitness_fn is None:
        fitness_fn = fitness_shader_correctness

    result = compile_glyph_program(program)

    result_dict = {
        "spirv_size": result.spirv_size,
        "word_count": result.word_count,
        "magic": result.magic,
    }

    fitness = fitness_fn(program, result_dict) if result.success else 0.0
    return result, fitness
