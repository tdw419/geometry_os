# systems/genome/src/ast_nodes.py
"""
AST node definitions for genome code generation.
"""
from dataclasses import dataclass
from typing import Any


@dataclass
class ASTNode:
    """Base class for all AST nodes"""
    type: str


@dataclass
class LiteralNode(ASTNode):
    """Literal value"""
    value: Any
    data_type: str | None = None


@dataclass
class VariableNode(ASTNode):
    """Variable reference"""
    name: str


@dataclass
class BinaryOpNode(ASTNode):
    """Binary operation"""
    operator: str
    left: dict[str, Any]
    right: dict[str, Any]


@dataclass
class UnaryOpNode(ASTNode):
    """Unary operation"""
    operator: str
    operand: dict[str, Any]


@dataclass
class IfNode(ASTNode):
    """If/else expression"""
    condition: dict[str, Any]
    then_branch: dict[str, Any]
    else_branch: dict[str, Any] | None = None


@dataclass
class BlockNode(ASTNode):
    """Block of statements"""
    statements: list[dict[str, Any]]


@dataclass
class CallNode(ASTNode):
    """Function call"""
    function: str
    arguments: list[dict[str, Any]]


@dataclass
class LetNode(ASTNode):
    """Variable declaration"""
    name: str
    value_type: str | None
    value: dict[str, Any]
    mutable: bool = False


@dataclass
class ReturnNode(ASTNode):
    """Return statement"""
    value: dict[str, Any] | None = None


@dataclass
class LoopNode(ASTNode):
    """Loop expression"""
    body: dict[str, Any]


@dataclass
class MatchNode(ASTNode):
    """Match expression"""
    value: dict[str, Any]
    arms: list[dict[str, Any]]


def parse_ast_node(data: dict[str, Any]) -> ASTNode:
    """Parse a dictionary into an AST node"""
    node_type = data.get("type", "")

    if node_type == "literal":
        return LiteralNode(
            type=node_type,
            value=data.get("value"),
            data_type=data.get("data_type")
        )
    elif node_type == "variable":
        return VariableNode(type=node_type, name=data["name"])
    elif node_type == "binary_op":
        return BinaryOpNode(
            type=node_type,
            operator=data["operator"],
            left=data["left"],
            right=data["right"]
        )
    elif node_type == "unary_op":
        return UnaryOpNode(
            type=node_type,
            operator=data["operator"],
            operand=data["operand"]
        )
    elif node_type == "if":
        return IfNode(
            type=node_type,
            condition=data["condition"],
            then_branch=data["then_branch"],
            else_branch=data.get("else_branch")
        )
    elif node_type == "block":
        return BlockNode(
            type=node_type,
            statements=data.get("statements", [])
        )
    elif node_type == "call":
        return CallNode(
            type=node_type,
            function=data["function"],
            arguments=data.get("arguments", [])
        )
    elif node_type == "let":
        return LetNode(
            type=node_type,
            name=data["name"],
            value_type=data.get("value_type"),
            value=data["value"],
            mutable=data.get("mutable", False)
        )
    elif node_type == "return":
        return ReturnNode(type=node_type, value=data.get("value"))
    elif node_type == "loop":
        return LoopNode(type=node_type, body=data["body"])
    elif node_type == "match":
        return MatchNode(
            type=node_type,
            value=data["value"],
            arms=data.get("arms", [])
        )
    else:
        raise ValueError(f"Unknown AST node type: {node_type}")
