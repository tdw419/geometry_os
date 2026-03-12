#!/usr/bin/env python3
"""
Python to GlyphStratum Parser

Converts Python code into GlyphStratum glyphs by analyzing AST.
"""
import ast
import sys
from typing import List, Dict, Any, Optional
from dataclasses import dataclass, field

sys.path.insert(0, '.')
from glyph_stratum.core.stratum import Stratum, Opcode, GlyphInfo, GlyphMetadata, ProvenanceInfo
from glyph_stratum.core.glyph_registry import GlyphRegistry


class PythonToGlyphParser:
    """
    Converts Python code to GlyphStratum glyphs.

    Strategy:
    1. Parse Python AST
    2. Map literals/constants -> SUBSTRATE
    3. Map variables -> MEMORY
    4. Map functions/control flow -> LOGIC
    5. Map function signatures -> SPEC
    6. Map module intent -> INTENT
    """

    def __init__(self):
        self.registry = GlyphRegistry()
        self.node_map: Dict[int, int] = {}  # Python node id -> glyph index

        self._processed_nodes: set = set()

    def parse(self, code: str, module_name: str = "python_module") -> GlyphRegistry:
        """Parse Python code and return a GlyphRegistry."""
        self._processed_nodes = set()
        tree = ast.parse(code)

        # Walk the tree and create glyphs
        self._walk_and_create(tree)

        # Create module INTENT glyph
        self._create_intent_glyph(module_name)

        return self.registry

    def _walk_and_create(self, node: ast.AST):
        """Walk AST and create glyphs in order."""
        # Mark as processed
        if id(node) in self._processed_nodes:
            return
        self._processed_nodes.add(id(node))

        # Process based on node type
        if isinstance(node, ast.Constant):
            self._create_substrate_glyph(node)
        elif isinstance(node, ast.Num):
            self._create_substrate_glyph(node)
        elif isinstance(node, ast.Str):
            self._create_substrate_glyph(node)
        elif isinstance(node, ast.Name):
            self._create_name_glyph(node)
        elif isinstance(node, ast.Assign):
            self._create_assign_glyph(node)
        elif isinstance(node, ast.BinOp):
            self._create_binop_glyph(node)
        elif isinstance(node, ast.Compare):
            self._create_compare_glyph(node)
        elif isinstance(node, ast.If):
            self._create_if_glyph(node)
        elif isinstance(node, ast.While):
            self._create_while_glyph(node)
        elif isinstance(node, ast.For):
            self._create_for_glyph(node)
        elif isinstance(node, ast.Call):
            self._create_call_glyph(node)
        elif isinstance(node, ast.Return):
            self._create_return_glyph(node)
        elif isinstance(node, ast.FunctionDef):
            self._create_function_glyph(node)

        # Recursively walk children
        for child in ast.iter_child_nodes(node):
            self._walk_and_create(child)

    def _create_substrate_glyph(self, node):
        """Create a SUBSTRATE glyph for literals."""
        if isinstance(node, ast.Constant):
            value = node.value
            idx = self.registry.create(
                stratum=Stratum.SUBSTRATE,
                opcode=Opcode.DATA,
                rationale=f"Literal: {repr(value)}",
                dependencies=[],
                invariants={"value": str(value), "type": type(value).__name__}
            )
        elif isinstance(node, ast.Num):
            idx = self.registry.create(
                stratum=Stratum.SUBSTRATE,
                opcode=Opcode.DATA,
                rationale=f"Number: {node.n}",
                dependencies=[],
                invariants={"value": node.n, "type": "int"}
            )
        elif isinstance(node, ast.Str):
            idx = self.registry.create(
                stratum=Stratum.SUBSTRATE,
                opcode=Opcode.DATA,
                rationale=f"String: {repr(node.s)}",
                dependencies=[],
                invariants={"value": node.s, "type": "str"}
            )

        self.node_map[id(node)] = idx

    def _create_name_glyph(self, node: ast.Name):
        """Create a MEMORY glyph for variable reference."""
        idx = self.registry.create(
            stratum=Stratum.MEMORY,
            opcode=Opcode.LOAD,
            rationale=f"Variable: {node.id}",
            dependencies=[],
            invariants={"name": node.id}
        )
        self.node_map[id(node)] = idx

    def _create_assign_glyph(self, node: ast.Assign):
        """Create MEMORY glyph for variable assignment."""
        if not node.targets:
            return

        target = node.targets[0]
        if not isinstance(target, ast.Name):
            return

        var_name = target.id

        # Dependency on value
        deps = []
        if id(node.value) in self.node_map:
            deps.append(self.node_map[id(node.value)])

        idx = self.registry.create(
            stratum=Stratum.MEMORY,
            opcode=Opcode.STORE,
            rationale=f"Assign: {var_name}",
            dependencies=deps,
            invariants={"name": var_name}
        )
        self.node_map[id(node)] = idx

    def _create_binop_glyph(self, node: ast.BinOp):
        """Create LOGIC glyph for binary operation."""
        op_map = {
            ast.Add: "+",
            ast.Sub: "-",
            ast.Mult: "*",
            ast.Div: "/",
            ast.Mod: "%",
        }

        op_sym = op_map.get(type(node.op), "?")

        # Dependencies on operands
        deps = []
        if id(node.left) in self.node_map:
            deps.append(self.node_map[id(node.left)])
        if id(node.right) in self.node_map:
            deps.append(self.node_map[id(node.right)])

        idx = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=Opcode.CALL,
            rationale=f"Operation: {op_sym}",
            dependencies=deps,
            invariants={"operator": op_sym}
        )
        self.node_map[id(node)] = idx

    def _create_compare_glyph(self, node: ast.Compare):
        """Create LOGIC glyph for comparison."""
        deps = []
        if id(node.left) in self.node_map:
            deps.append(self.node_map[id(node.left)])
        if node.comparators and id(node.comparators[0]) in self.node_map:
            deps.append(self.node_map[id(node.comparators[0])])

        idx = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=Opcode.BRANCH,
            rationale="Comparison",
            dependencies=deps,
            invariants={}
        )
        self.node_map[id(node)] = idx

    def _create_if_glyph(self, node: ast.If):
        """Create LOGIC glyph for if statement."""
        deps = []
        if id(node.test) in self.node_map:
            deps.append(self.node_map[id(node.test)])

        idx = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=Opcode.BRANCH,
            rationale="If statement",
            dependencies=deps,
            invariants={}
        )
        self.node_map[id(node)] = idx

    def _create_while_glyph(self, node: ast.While):
        """Create LOGIC glyph for while loop."""
        deps = []
        if id(node.test) in self.node_map:
            deps.append(self.node_map[id(node.test)])

        idx = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=Opcode.LOOP,
            rationale="While loop",
            dependencies=deps,
            invariants={}
        )
        self.node_map[id(node)] = idx

    def _create_for_glyph(self, node: ast.For):
        """Create LOGIC glyph for for loop."""
        idx = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=Opcode.LOOP,
            rationale="For loop",
            dependencies=[],
            invariants={"iter_var": node.target.id if isinstance(node.target, ast.Name) else "unknown"}
        )
        self.node_map[id(node)] = idx

    def _create_call_glyph(self, node: ast.Call):
        """Create LOGIC glyph for function call."""
        func_name = "unknown"
        if isinstance(node.func, ast.Name):
            func_name = node.func.id

        # Dependencies on arguments
        deps = []
        for arg in node.args:
            if id(arg) in self.node_map:
                deps.append(self.node_map[id(arg)])

        idx = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=Opcode.CALL,
            rationale=f"Call: {func_name}",
            dependencies=deps,
            invariants={}
        )
        self.node_map[id(node)] = idx

    def _create_return_glyph(self, node: ast.Return):
        """Create LOGIC glyph for return statement."""
        deps = []
        if node.value and id(node.value) in self.node_map:
            deps.append(self.node_map[id(node.value)])

        idx = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=Opcode.RETURN,
            rationale="Return",
            dependencies=deps,
            invariants={}
        )
        self.node_map[id(node)] = idx

    def _create_function_glyph(self, node: ast.FunctionDef):
        """Create SPEC glyph for function definition."""
        # Dependencies on all statements in function body
        deps = []
        for child in ast.walk(node):
            if id(child) in self.node_map and child is not node:
                dep_idx = self.node_map[id(child)]
                if dep_idx not in deps:
                    deps.append(dep_idx)

        idx = self.registry.create(
            stratum=Stratum.SPEC,
            opcode=Opcode.EXPORT,
            rationale=f"Function: {node.name}",
            dependencies=deps,
            invariants={"name": node.name, "args": [arg.arg for arg in node.args.args if isinstance(arg, ast.arg)]}
        )
        self.node_map[id(node)] = idx

    def _create_intent_glyph(self, module_name: str):
        """Create INTENT glyph for the module."""
        # Dependencies on all SPEC glyphs
        deps = []
        for idx, glyph in self.registry.glyphs.items():
            if glyph.stratum == Stratum.SPEC:
                deps.append(idx)

        idx = self.registry.create(
            stratum=Stratum.INTENT,
            opcode=Opcode.MODULE,
            rationale=f"Python module: {module_name}",
            dependencies=deps,
            invariants={"name": module_name}
        )
        self.node_map["module"] = idx

    def to_json(self) -> str:
        """Export the registry to JSON format."""
        import json
        glyphs = {}
        for idx, glyph in self.registry.glyphs.items():
            glyphs[str(idx)] = {
                "stratum": glyph.stratum.name,
                "opcode": glyph.opcode.name,
                "rationale": glyph.metadata.rationale,
                "dependencies": glyph.metadata.dependencies,
                "invariants": glyph.metadata.invariants
            }

        return json.dumps({
            "name": "parsed_python",
            "glyphs": glyphs
        }, indent=2)


def parse_python_code(code: str, module_name: str = "module") -> Dict:
    """Convenience function to parse Python code and return glyph dict."""
    parser = PythonToGlyphParser()
    registry = parser.parse(code, module_name)
    return json.loads(parser.to_json())


if __name__ == "__main__":
    # Test examples
    test_cases = [
        ("add.py", "def add(a, b):\n    return a + b"),
        ("factorial.py", "def factorial(n):\n    if n <= 1:\n        return 1\n    return n * factorial(n - 1)"),
        ("loop.py", "def sum_to_n(n):\n    total = 0\n    for i in range(n):\n        total = total + i\n    return total"),
    ]

    print("=" * 60)
    print("Python to GlyphStratum Parser Test")
    print("=" * 60)

    for name, code in test_cases:
        print(f"\n--- {name} ---")
        print(f"Code:\n{code}")
        print()

        parser = PythonToGlyphParser()
        try:
            registry = parser.parse(code, name.replace(".py", ""))
            coherence = registry.validate_stratum_order()

            print(f"Glyphs: {registry.count()}")
            print(f"Coherence: {coherence*100:.1f}%")
            print("\nStrata distribution:")
            for stratum_name, count in registry.strata_summary().items():
                if count > 0:
                    print(f"  {stratum_name}: {count}")

            print("\nGlyph details:")
            for idx, glyph in sorted(registry.glyphs.items()):
                deps_str = str(glyph.metadata.dependencies) if glyph.metadata.dependencies else "[]"
                print(f"  [{idx}] {glyph.stratum.name:10} {glyph.opcode.name:8} deps={deps_str}")
        except Exception as e:
            print(f"Error: {e}")
            import traceback
            traceback.print_exc()

    print("\n" + "=" * 60)
