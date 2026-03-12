#!/usr/bin/env python3
"""
Python to GlyphStratum Parser

Converts Python code into GlyphStratum glyph programs by analyzing AST.

Usage:
    python_parser.py <file.py> [-o output.json]
    python_parser.py -c "def add(a, b): return a + b"
"""
import ast
import sys
import json
import argparse
from typing import Dict, List, Any, Optional, Set
from dataclasses import dataclass, field


@dataclass
class GlyphInfo:
    """Information about a parsed glyph."""
    stratum: str
    opcode: str
    rationale: str
    dependencies: List[int] = field(default_factory=list)
    invariants: Dict[str, Any] = field(default_factory=dict)


class PythonToGlyphParser(ast.NodeVisitor):
    """
    Parses Python AST into GlyphStratum glyphs.

    Strata mapping:
    - SUBSTRATE: Literals, constants, raw data
    - MEMORY: Variables, assignments, parameters
    - LOGIC: Function calls, operations, control flow
    - SPEC: Function definitions, class definitions
    - INTENT: Module-level intent (main entry point)
    """

    def __init__(self, source_name: str = "module"):
        self.source_name = source_name
        self.glyphs: Dict[int, GlyphInfo] = {}
        self.next_id: int = 0
        self.current_scope: List[str] = []
        self.var_to_glyph: Dict[str, int] = {}
        self.func_to_glyph: Dict[str, int] = {}

    def create_glyph(self, stratum: str, opcode: str, rationale: str,
                     dependencies: List[int] = None, invariants: Dict = None) -> int:
        """Create a new glyph and return its ID."""
        glyph_id = self.next_id
        self.next_id += 1

        self.glyphs[glyph_id] = GlyphInfo(
            stratum=stratum,
            opcode=opcode,
            rationale=rationale,
            dependencies=dependencies or [],
            invariants=invariants or {}
        )
        return glyph_id

    def parse(self, source: str) -> Dict:
        """Parse Python source code into glyph program."""
        tree = ast.parse(source)
        self.visit(tree)
        return self.to_dict()

    def to_dict(self) -> Dict:
        """Convert glyphs to dictionary format."""
        glyphs_dict = {}
        for gid, glyph in self.glyphs.items():
            glyphs_dict[str(gid)] = {
                "stratum": glyph.stratum,
                "opcode": glyph.opcode,
                "rationale": glyph.rationale,
                "dependencies": glyph.dependencies,
                "invariants": glyph.invariants
            }

        return {
            "name": self.source_name,
            "glyphs": glyphs_dict
        }

    # AST Visitors

    def visit_Module(self, node: ast.Module):
        """Visit module - creates INTENT glyph."""
        # First pass: collect all definitions
        for child in node.body:
            if isinstance(child, (ast.FunctionDef, ast.AsyncFunctionDef, ast.ClassDef)):
                self.visit(child)

        # Create module intent glyph
        deps = []
        for child in node.body:
            if isinstance(child, ast.Expr) and isinstance(child.value, ast.Constant):
                # Docstring
                continue
            if isinstance(child, (ast.FunctionDef, ast.AsyncFunctionDef)):
                if child.name in self.func_to_glyph:
                    deps.append(self.func_to_glyph[child.name])
            elif isinstance(child, ast.ClassDef):
                if child.name in self.func_to_glyph:
                    deps.append(self.func_to_glyph[child.name])
            elif isinstance(child, ast.If):
                # Handle if __name__ == "__main__"
                for sub in ast.walk(child):
                    if isinstance(sub, ast.Call):
                        call_name = self._get_call_name(sub)
                        if call_name in self.func_to_glyph:
                            deps.append(self.func_to_glyph[call_name])

        # Only create INTENT if we have content
        if deps:
            self.create_glyph(
                stratum="INTENT",
                opcode="MODULE",
                rationale=f"module: {self.source_name}",
                dependencies=deps
            )

    def visit_FunctionDef(self, node: ast.FunctionDef):
        """Visit function definition - creates SPEC glyph."""
        self.current_scope.append(node.name)

        # Create parameter glyphs (MEMORY)
        param_glyphs = []
        for arg in node.args.args:
            param_id = self.create_glyph(
                stratum="MEMORY",
                opcode="LOAD",
                rationale=f"parameter: {arg.arg}",
                dependencies=[]
            )
            self.var_to_glyph[f"{node.name}.{arg.arg}"] = param_id
            param_glyphs.append(param_id)

        # Visit function body
        body_deps = []
        for stmt in node.body:
            if isinstance(stmt, ast.Expr) and isinstance(stmt.value, ast.Constant):
                continue  # Skip docstrings
            stmt_glyph = self._visit_statement(stmt)
            if stmt_glyph is not None:
                body_deps.append(stmt_glyph)

        # Create function SPEC glyph
        func_id = self.create_glyph(
            stratum="SPEC",
            opcode="EXPORT",
            rationale=f"def {node.name}({', '.join(a.arg for a in node.args.args)})",
            dependencies=param_glyphs + body_deps,
            invariants={
                "name": node.name,
                "args": [a.arg for a in node.args.args],
                "returns": self._get_return_type(node)
            }
        )
        self.func_to_glyph[node.name] = func_id

        self.current_scope.pop()
        return func_id

    def visit_AsyncFunctionDef(self, node: ast.AsyncFunctionDef):
        """Visit async function definition."""
        return self.visit_FunctionDef(node)

    def visit_ClassDef(self, node: ast.ClassDef):
        """Visit class definition - creates SPEC glyph."""
        self.current_scope.append(node.name)

        # Visit class body
        body_deps = []
        for stmt in node.body:
            if isinstance(stmt, (ast.FunctionDef, ast.AsyncFunctionDef)):
                method_id = self.visit(stmt)
                if method_id is not None:
                    body_deps.append(method_id)

        # Create class SPEC glyph
        class_id = self.create_glyph(
            stratum="SPEC",
            opcode="TYPE",
            rationale=f"class {node.name}",
            dependencies=body_deps,
            invariants={"name": node.name, "bases": [self._get_name(b) for b in node.bases]}
        )
        self.func_to_glyph[node.name] = class_id

        self.current_scope.pop()
        return class_id

    def _visit_statement(self, node: ast.stmt) -> Optional[int]:
        """Visit a statement and return its glyph ID."""
        if isinstance(node, ast.Assign):
            return self._visit_assign(node)
        elif isinstance(node, ast.AugAssign):
            return self._visit_augassign(node)
        elif isinstance(node, ast.Return):
            return self._visit_return(node)
        elif isinstance(node, ast.Expr):
            return self._visit_expr_stmt(node)
        elif isinstance(node, ast.If):
            return self._visit_if(node)
        elif isinstance(node, ast.For):
            return self._visit_for(node)
        elif isinstance(node, ast.While):
            return self._visit_while(node)
        elif isinstance(node, ast.With):
            return self._visit_with(node)
        elif isinstance(node, ast.Try):
            return self._visit_try(node)
        return None

    def _visit_assign(self, node: ast.Assign) -> int:
        """Visit assignment statement."""
        # Visit RHS first
        value_glyph = self._visit_expression(node.value)

        # Determine stratum based on RHS - if RHS is LOGIC, assignment must be LOGIC too
        value_stratum = None
        if value_glyph is not None and value_glyph in self.glyphs:
            value_stratum = self.glyphs[value_glyph].stratum

        # Assignment stratum must be >= value stratum to maintain coherence
        stratum_order = {"SUBSTRATE": 0, "MEMORY": 1, "LOGIC": 2, "SPEC": 3, "INTENT": 4}
        if value_stratum and stratum_order.get(value_stratum, 0) >= 2:
            assign_stratum = "LOGIC"
        else:
            assign_stratum = "MEMORY"

        # Create assignment glyph for each target
        assign_glyphs = []
        for target in node.targets:
            if isinstance(target, ast.Name):
                var_name = target.id
                scope_name = ".".join(self.current_scope + [var_name])

                assign_id = self.create_glyph(
                    stratum=assign_stratum,
                    opcode="STORE",
                    rationale=f"{var_name} = ...",
                    dependencies=[value_glyph] if value_glyph is not None else [],
                    invariants={"variable": var_name}
                )
                self.var_to_glyph[scope_name] = assign_id
                assign_glyphs.append(assign_id)

        # Return first assignment (or create a combined one)
        return assign_glyphs[0] if assign_glyphs else value_glyph

    def _visit_augassign(self, node: ast.AugAssign) -> int:
        """Visit augmented assignment (+=, -=, etc.)."""
        value_glyph = self._visit_expression(node.value)

        op_map = {
            ast.Add: "+=", ast.Sub: "-=", ast.Mult: "*=", ast.Div: "/=",
            ast.Mod: "%=", ast.BitOr: "|=", ast.BitAnd: "&="
        }
        op_str = op_map.get(type(node.op), "?=")

        if isinstance(node.target, ast.Name):
            var_name = node.target.id
            return self.create_glyph(
                stratum="LOGIC",
                opcode="CALL",
                rationale=f"{var_name} {op_str} ...",
                dependencies=[value_glyph] if value_glyph is not None else []
            )
        return value_glyph

    def _visit_return(self, node: ast.Return) -> int:
        """Visit return statement."""
        if node.value is None:
            return self.create_glyph(
                stratum="LOGIC",
                opcode="RETURN",
                rationale="return",
                dependencies=[]
            )

        value_glyph = self._visit_expression(node.value)
        return self.create_glyph(
            stratum="LOGIC",
            opcode="RETURN",
            rationale=f"return {self._expr_str(node.value)}",
            dependencies=[value_glyph] if value_glyph is not None else []
        )

    def _visit_expr_stmt(self, node: ast.Expr) -> Optional[int]:
        """Visit expression statement."""
        return self._visit_expression(node.value)

    def _visit_if(self, node: ast.If) -> int:
        """Visit if statement."""
        cond_glyph = self._visit_expression(node.test)

        body_deps = []
        for stmt in node.body:
            stmt_glyph = self._visit_statement(stmt)
            if stmt_glyph is not None:
                body_deps.append(stmt_glyph)

        else_deps = []
        for stmt in node.orelse:
            stmt_glyph = self._visit_statement(stmt)
            if stmt_glyph is not None:
                else_deps.append(stmt_glyph)

        all_deps = ([cond_glyph] if cond_glyph is not None else []) + body_deps + else_deps

        return self.create_glyph(
            stratum="LOGIC",
            opcode="BRANCH",
            rationale=f"if {self._expr_str(node.test)}",
            dependencies=all_deps
        )

    def _visit_for(self, node: ast.For) -> int:
        """Visit for loop."""
        iter_glyph = self._visit_expression(node.iter)

        # Create loop variable - must be LOGIC since it depends on iterator
        if isinstance(node.target, ast.Name):
            var_id = self.create_glyph(
                stratum="LOGIC",
                opcode="ALLOC",
                rationale=f"loop var: {node.target.id}",
                dependencies=[iter_glyph] if iter_glyph is not None else []
            )

        body_deps = []
        for stmt in node.body:
            stmt_glyph = self._visit_statement(stmt)
            if stmt_glyph is not None:
                body_deps.append(stmt_glyph)

        all_deps = ([iter_glyph] if iter_glyph is not None else []) + body_deps

        return self.create_glyph(
            stratum="LOGIC",
            opcode="LOOP",
            rationale=f"for {self._expr_str(node.target)} in ...",
            dependencies=all_deps
        )

    def _visit_while(self, node: ast.While) -> int:
        """Visit while loop."""
        cond_glyph = self._visit_expression(node.test)

        body_deps = []
        for stmt in node.body:
            stmt_glyph = self._visit_statement(stmt)
            if stmt_glyph is not None:
                body_deps.append(stmt_glyph)

        all_deps = ([cond_glyph] if cond_glyph is not None else []) + body_deps

        return self.create_glyph(
            stratum="LOGIC",
            opcode="LOOP",
            rationale=f"while {self._expr_str(node.test)}",
            dependencies=all_deps
        )

    def _visit_with(self, node: ast.With) -> int:
        """Visit with statement."""
        context_deps = []
        for item in node.items:
            ctx_glyph = self._visit_expression(item.context_expr)
            if ctx_glyph is not None:
                context_deps.append(ctx_glyph)

        body_deps = []
        for stmt in node.body:
            stmt_glyph = self._visit_statement(stmt)
            if stmt_glyph is not None:
                body_deps.append(stmt_glyph)

        return self.create_glyph(
            stratum="LOGIC",
            opcode="CALL",
            rationale="with ...",
            dependencies=context_deps + body_deps
        )

    def _visit_try(self, node: ast.Try) -> int:
        """Visit try/except."""
        body_deps = []
        for stmt in node.body:
            stmt_glyph = self._visit_statement(stmt)
            if stmt_glyph is not None:
                body_deps.append(stmt_glyph)

        for handler in node.handlers:
            for stmt in handler.body:
                stmt_glyph = self._visit_statement(stmt)
                if stmt_glyph is not None:
                    body_deps.append(stmt_glyph)

        return self.create_glyph(
            stratum="LOGIC",
            opcode="BRANCH",
            rationale="try/except",
            dependencies=body_deps
        )

    def _visit_expression(self, node: ast.expr) -> Optional[int]:
        """Visit an expression and return its glyph ID."""
        if node is None:
            return None

        if isinstance(node, ast.Constant):
            return self._visit_constant(node)
        elif isinstance(node, ast.Name):
            return self._visit_name(node)
        elif isinstance(node, ast.BinOp):
            return self._visit_binop(node)
        elif isinstance(node, ast.UnaryOp):
            return self._visit_unaryop(node)
        elif isinstance(node, ast.Compare):
            return self._visit_compare(node)
        elif isinstance(node, ast.Call):
            return self._visit_call(node)
        elif isinstance(node, ast.Attribute):
            return self._visit_attribute(node)
        elif isinstance(node, ast.Subscript):
            return self._visit_subscript(node)
        elif isinstance(node, ast.List):
            return self._visit_list(node)
        elif isinstance(node, ast.Dict):
            return self._visit_dict(node)
        elif isinstance(node, ast.IfExp):
            return self._visit_ifexp(node)
        elif isinstance(node, ast.Lambda):
            return self._visit_lambda(node)
        return None

    def _visit_constant(self, node: ast.Constant) -> int:
        """Visit constant/literal."""
        value_repr = repr(node.value)
        if len(value_repr) > 30:
            value_repr = value_repr[:30] + "..."

        return self.create_glyph(
            stratum="SUBSTRATE",
            opcode="DATA",
            rationale=f"literal: {value_repr}",
            invariants={"value": node.value, "type": type(node.value).__name__}
        )

    def _visit_name(self, node: ast.Name) -> int:
        """Visit variable name reference."""
        # Look up variable in scope
        scope_key = ".".join(self.current_scope + [node.id])
        if scope_key in self.var_to_glyph:
            return self.var_to_glyph[scope_key]

        # Check if it's a function reference
        if node.id in self.func_to_glyph:
            return self.func_to_glyph[node.id]

        # Create new reference
        return self.create_glyph(
            stratum="MEMORY",
            opcode="LOAD",
            rationale=f"var: {node.id}",
            invariants={"name": node.id}
        )

    def _visit_binop(self, node: ast.BinOp) -> int:
        """Visit binary operation."""
        left_glyph = self._visit_expression(node.left)
        right_glyph = self._visit_expression(node.right)

        op_map = {
            ast.Add: "+", ast.Sub: "-", ast.Mult: "*", ast.Div: "/",
            ast.Mod: "%", ast.Pow: "**", ast.FloorDiv: "//",
            ast.BitOr: "|", ast.BitAnd: "&", ast.BitXor: "^",
            ast.LShift: "<<", ast.RShift: ">>"
        }
        op_str = op_map.get(type(node.op), "?")

        return self.create_glyph(
            stratum="LOGIC",
            opcode="CALL",
            rationale=f"{self._expr_str(node.left)} {op_str} {self._expr_str(node.right)}",
            dependencies=[left_glyph, right_glyph]
        )

    def _visit_unaryop(self, node: ast.UnaryOp) -> int:
        """Visit unary operation."""
        operand_glyph = self._visit_expression(node.operand)

        op_map = {ast.UAdd: "+", ast.USub: "-", ast.Not: "not", ast.Invert: "~"}
        op_str = op_map.get(type(node.op), "?")

        return self.create_glyph(
            stratum="LOGIC",
            opcode="CALL",
            rationale=f"{op_str}{self._expr_str(node.operand)}",
            dependencies=[operand_glyph] if operand_glyph is not None else []
        )

    def _visit_compare(self, node: ast.Compare) -> int:
        """Visit comparison."""
        left_glyph = self._visit_expression(node.left)

        deps = [left_glyph] if left_glyph is not None else []
        for comparator in node.comparators:
            comp_glyph = self._visit_expression(comparator)
            if comp_glyph is not None:
                deps.append(comp_glyph)

        op_map = {
            ast.Eq: "==", ast.NotEq: "!=", ast.Lt: "<", ast.LtE: "<=",
            ast.Gt: ">", ast.GtE: ">=", ast.Is: "is", ast.IsNot: "is not",
            ast.In: "in", ast.NotIn: "not in"
        }
        ops = [op_map.get(type(op), "?") for op in node.ops]

        return self.create_glyph(
            stratum="LOGIC",
            opcode="BRANCH",
            rationale=f"{self._expr_str(node.left)} {' '.join(ops)} ...",
            dependencies=deps
        )

    def _visit_call(self, node: ast.Call) -> int:
        """Visit function call."""
        # Visit arguments
        arg_deps = []
        for arg in node.args:
            arg_glyph = self._visit_expression(arg)
            if arg_glyph is not None:
                arg_deps.append(arg_glyph)

        for kw in node.keywords:
            kw_glyph = self._visit_expression(kw.value)
            if kw_glyph is not None:
                arg_deps.append(kw_glyph)

        func_name = self._get_call_name(node)

        # Check if calling a defined function (runtime reference)
        runtime_refs = []
        if func_name in self.func_to_glyph:
            runtime_refs.append(self.func_to_glyph[func_name])

        call_glyph = self.create_glyph(
            stratum="LOGIC",
            opcode="CALL",
            rationale=f"call: {func_name}(...)",
            dependencies=arg_deps,
            invariants={"function": func_name, "args": len(node.args)}
        )

        # Add runtime references for recursive calls
        if runtime_refs:
            self.glyphs[call_glyph].invariants["runtime_refs"] = runtime_refs

        return call_glyph

    def _visit_attribute(self, node: ast.Attribute) -> int:
        """Visit attribute access."""
        value_glyph = self._visit_expression(node.value)

        return self.create_glyph(
            stratum="LOGIC",
            opcode="CALL",
            rationale=f"{self._expr_str(node.value)}.{node.attr}",
            dependencies=[value_glyph] if value_glyph is not None else []
        )

    def _visit_subscript(self, node: ast.Subscript) -> int:
        """Visit subscript/index access."""
        value_glyph = self._visit_expression(node.value)
        slice_glyph = self._visit_expression(node.slice) if isinstance(node.slice, ast.expr) else None

        deps = [value_glyph] if value_glyph is not None else []
        if slice_glyph is not None:
            deps.append(slice_glyph)

        return self.create_glyph(
            stratum="LOGIC",
            opcode="CALL",
            rationale=f"{self._expr_str(node.value)}[...]",
            dependencies=deps
        )

    def _visit_list(self, node: ast.List) -> int:
        """Visit list literal."""
        elem_deps = []
        for elem in node.elts:
            elem_glyph = self._visit_expression(elem)
            if elem_glyph is not None:
                elem_deps.append(elem_glyph)

        return self.create_glyph(
            stratum="SUBSTRATE",
            opcode="DATA",
            rationale=f"list[{len(node.elts)}]",
            dependencies=elem_deps
        )

    def _visit_dict(self, node: ast.Dict) -> int:
        """Visit dict literal."""
        elem_deps = []
        for key, value in zip(node.keys, node.values):
            if key is not None:
                key_glyph = self._visit_expression(key)
                if key_glyph is not None:
                    elem_deps.append(key_glyph)
            val_glyph = self._visit_expression(value)
            if val_glyph is not None:
                elem_deps.append(val_glyph)

        return self.create_glyph(
            stratum="SUBSTRATE",
            opcode="DATA",
            rationale=f"dict[{len(node.keys)}]",
            dependencies=elem_deps
        )

    def _visit_ifexp(self, node: ast.IfExp) -> int:
        """Visit ternary if expression."""
        test_glyph = self._visit_expression(node.test)
        body_glyph = self._visit_expression(node.body)
        else_glyph = self._visit_expression(node.orelse)

        deps = [g for g in [test_glyph, body_glyph, else_glyph] if g is not None]

        return self.create_glyph(
            stratum="LOGIC",
            opcode="BRANCH",
            rationale=f"... if {self._expr_str(node.test)} else ...",
            dependencies=deps
        )

    def _visit_lambda(self, node: ast.Lambda) -> int:
        """Visit lambda expression."""
        body_glyph = self._visit_expression(node.body)

        return self.create_glyph(
            stratum="LOGIC",
            opcode="CALL",
            rationale=f"lambda: {self._expr_str(node.body)}",
            dependencies=[body_glyph] if body_glyph is not None else []
        )

    # Helper methods

    def _get_call_name(self, node: ast.Call) -> str:
        """Get the name of a function being called."""
        if isinstance(node.func, ast.Name):
            return node.func.id
        elif isinstance(node.func, ast.Attribute):
            parts = []
            current = node.func
            while isinstance(current, ast.Attribute):
                parts.append(current.attr)
                current = current.value
            if isinstance(current, ast.Name):
                parts.append(current.id)
            return ".".join(reversed(parts))
        return "unknown"

    def _get_name(self, node: ast.expr) -> str:
        """Get name from a name node."""
        if isinstance(node, ast.Name):
            return node.id
        return "?"

    def _get_return_type(self, node: ast.FunctionDef) -> Optional[str]:
        """Get return type annotation if present."""
        if node.returns:
            return ast.unparse(node.returns)
        return None

    def _expr_str(self, node: ast.expr) -> str:
        """Get string representation of expression."""
        try:
            return ast.unparse(node)[:50]
        except:
            return "?"


def parse_python_file(filepath: str) -> Dict:
    """Parse a Python file into glyphs."""
    with open(filepath, 'r') as f:
        source = f.read()

    name = filepath.replace('.py', '').replace('/', '_')
    parser = PythonToGlyphParser(name)
    return parser.parse(source)


def parse_python_code(code: str, name: str = "inline") -> Dict:
    """Parse Python code string into glyphs."""
    parser = PythonToGlyphParser(name)
    return parser.parse(code)


def main():
    parser = argparse.ArgumentParser(
        description="Parse Python code into GlyphStratum glyphs",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python_parser.py my_script.py
  python_parser.py my_script.py -o output.json
  python_parser.py -c "def add(a, b): return a + b"
        """
    )

    parser.add_argument("file", nargs="?", help="Python file to parse")
    parser.add_argument("-c", "--code", help="Parse code string instead of file")
    parser.add_argument("-o", "--output", help="Output JSON file")
    parser.add_argument("-v", "--verbose", action="store_true", help="Show glyph details")

    args = parser.parse_args()

    if args.code:
        result = parse_python_code(args.code, "inline")
    elif args.file:
        result = parse_python_file(args.file)
    else:
        parser.print_help()
        return 1

    # Output
    json_output = json.dumps(result, indent=2)

    if args.output:
        with open(args.output, 'w') as f:
            f.write(json_output)
        print(f"Parsed {len(result['glyphs'])} glyphs -> {args.output}")
    else:
        print(json_output)

    if args.verbose:
        print(f"\nGlyph summary:")
        for gid, glyph in sorted(result['glyphs'].items(), key=lambda x: int(x[0])):
            deps_str = ", ".join(str(d) for d in glyph['dependencies']) if glyph['dependencies'] else "none"
            print(f"  [{gid:2}] {glyph['stratum']:10} {glyph['opcode']:8} deps: [{deps_str}]")

    return 0


if __name__ == "__main__":
    sys.exit(main() or 0)
