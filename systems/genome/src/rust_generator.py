# systems/genome/src/rust_generator.py
"""
Rust code generator from genome AST.
"""
from typing import Optional, List, Set, Dict, Any
from pathlib import Path
import sys

# Import genome_schema from spec directory
sys.path.insert(0, str(Path(__file__).parent.parent / "spec"))
from genome_schema import Gene, GeneType, Genome, Parameter

# Import ast_nodes from same directory
from ast_nodes import parse_ast_node, ASTNode


class RustCodeGenerator:
    """Generate Rust code from genome specifications"""

    def __init__(self, indent: str = "    "):
        self.indent = indent
        self.indent_level = 0

    def generate(self, genome: Genome) -> str:
        """Generate complete Rust code from a genome"""
        pieces = []

        # Header
        pieces.append("// Auto-generated from genome")
        pieces.append(f"// Generation: {genome.generation}")
        if genome.description:
            pieces.append(f"// {genome.description}")
        pieces.append("")

        # Apply regulatory logic
        active_genes = self._apply_regulatory_logic(genome)

        # Generate each active gene
        for gene in active_genes:
            if gene.type == GeneType.FUNCTION:
                pieces.append(self.generate_function(gene))
            elif gene.type == GeneType.STRUCT:
                pieces.append(self.generate_struct(gene))
            elif gene.type == GeneType.ENUM:
                pieces.append(self.generate_enum(gene))
            elif gene.type == GeneType.TRAIT:
                pieces.append(self.generate_trait(gene))
            elif gene.type == GeneType.IMPL:
                pieces.append(self.generate_impl(gene))
            elif gene.type == GeneType.CONSTANT:
                pieces.append(self.generate_constant(gene))
            pieces.append("")

        return "\n".join(pieces)

    def _apply_regulatory_logic(self, genome: Genome) -> List[Gene]:
        """Apply regulatory regions to determine active genes"""
        # Start with all genes
        gene_map = {g.id: g for g in genome.genes}
        active = set(gene_map.keys())

        # Apply suppressors
        for suppressor in genome.regulatory_regions.suppressors:
            active.discard(suppressor)

        # Apply promoters (ensure these are active)
        for promoter in genome.regulatory_regions.promoters:
            if promoter in gene_map:
                active.add(promoter)

        return [gene_map[gid] for gid in active if gid in gene_map]

    def generate_function(self, gene: Gene) -> str:
        """Generate a Rust function"""
        lines = []

        # Documentation
        if gene.documentation:
            lines.append(f"/// {gene.documentation}")

        # Annotations
        for annotation in gene.annotations:
            lines.append(f"#{annotation}")

        # Function signature
        params = ", ".join(
            f"{p.name}: {p.type}" for p in gene.parameters
        )

        return_type = f" -> {gene.return_type}" if gene.return_type else ""
        sig = f"fn {gene.name}({params}){return_type}"
        lines.append(sig + " {")

        # Function body
        self.indent_level += 1
        if gene.body:
            body_code = self.generate_expression(gene.body)
            lines.append(self.indent_str() + body_code)
        else:
            lines.append(self.indent_str() + "todo!()")
        self.indent_level -= 1

        lines.append("}")
        return "\n".join(lines)

    def generate_struct(self, gene: Gene) -> str:
        """Generate a Rust struct"""
        lines = []

        if gene.documentation:
            lines.append(f"/// {gene.documentation}")

        lines.append(f"pub struct {gene.name} {{")
        self.indent_level += 1

        for field in gene.fields:
            field_name = field["name"]
            field_type = field["type"]
            visibility = field.get("visibility", "pub")
            lines.append(f"{self.indent_str()}{visibility} {field_name}: {field_type},")

        self.indent_level -= 1
        lines.append("}")

        return "\n".join(lines)

    def generate_enum(self, gene: Gene) -> str:
        """Generate a Rust enum"""
        lines = []

        if gene.documentation:
            lines.append(f"/// {gene.documentation}")

        lines.append(f"pub enum {gene.name} {{")
        self.indent_level += 1

        for variant in gene.fields:
            variant_name = variant["name"]
            if "data" in variant:
                lines.append(f"{self.indent_str()}{variant_name}({variant['data']}),")
            else:
                lines.append(f"{self.indent_str()}{variant_name},")

        self.indent_level -= 1
        lines.append("}")

        return "\n".join(lines)

    def generate_trait(self, gene: Gene) -> str:
        """Generate a Rust trait"""
        lines = []

        if gene.documentation:
            lines.append(f"/// {gene.documentation}")

        lines.append(f"pub trait {gene.name} {{")
        self.indent_level += 1

        for method_name in gene.methods:
            lines.append(f"{self.indent_str()}fn {method_name}(...);")

        self.indent_level -= 1
        lines.append("}")

        return "\n".join(lines)

    def generate_impl(self, gene: Gene) -> str:
        """Generate a Rust impl block"""
        lines = []

        target = gene.name
        lines.append(f"impl {target} {{")
        self.indent_level += 1

        for method_name in gene.methods:
            lines.append(f"{self.indent_str()}// Method: {method_name}")

        self.indent_level -= 1
        lines.append("}")

        return "\n".join(lines)

    def generate_constant(self, gene: Gene) -> str:
        """Generate a Rust constant"""
        if gene.body:
            value = self.generate_expression(gene.body)
            return f"pub const {gene.name}: {gene.return_type or '_'} = {value};"
        return f"pub const {gene.name}: _ = todo!();"

    def generate_expression(self, expr: Dict[str, Any]) -> str:
        """Generate a Rust expression from AST node"""
        if not isinstance(expr, dict):
            return str(expr)

        node_type = expr.get("type", "")

        if node_type == "literal":
            value = expr.get("value")
            if isinstance(value, str):
                return f'"{value}"'
            return str(value)

        elif node_type == "variable":
            return expr["name"]

        elif node_type == "binary_op":
            left = self.generate_expression(expr["left"])
            right = self.generate_expression(expr["right"])
            op = expr["operator"]
            return f"({left} {op} {right})"

        elif node_type == "unary_op":
            operand = self.generate_expression(expr["operand"])
            op = expr["operator"]
            return f"{op}{operand}"

        elif node_type == "if":
            condition = self.generate_expression(expr["condition"])
            then_branch = self.generate_expression(expr["then_branch"])
            else_branch = self.generate_expression(expr["else_branch"]) if expr.get("else_branch") else None

            if else_branch:
                return f"if {condition} {{ {then_branch} }} else {{ {else_branch} }}"
            return f"if {condition} {{ {then_branch} }}"

        elif node_type == "block":
            statements = expr.get("statements", [])
            if not statements:
                return "{}"

            stmts = " ".join([
                self.generate_expression(s) + ";"
                for s in statements
            ])
            return f"{{ {stmts} }}"

        elif node_type == "call":
            func = expr["function"]
            args = ", ".join([
                self.generate_expression(a)
                for a in expr.get("arguments", [])
            ])
            return f"{func}({args})"

        elif node_type == "let":
            mut = "mut " if expr.get("mutable") else ""
            name = expr["name"]
            value = self.generate_expression(expr["value"])
            type_ann = f": {expr['value_type']}" if expr.get("value_type") else ""
            return f"let {mut}{name}{type_ann} = {value};"

        elif node_type == "return":
            if expr.get("value"):
                value = self.generate_expression(expr["value"])
                return f"return {value};"
            return "return;"

        elif node_type == "loop":
            body = self.generate_expression(expr["body"])
            return f"loop {{ {body} }}"

        elif node_type == "match":
            value = self.generate_expression(expr["value"])
            arms = []
            for arm in expr.get("arms", []):
                pattern = arm.get("pattern", "_")
                body = self.generate_expression(arm.get("body", "{}"))
                arms.append(f"{pattern} => {body},")
            arms_str = " ".join(arms)
            return f"match {value} {{ {arms_str} }}"

        else:
            return "/* unknown expression */"

    def indent_str(self) -> str:
        """Get current indentation string"""
        return self.indent * self.indent_level
