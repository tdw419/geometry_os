# systems/genome/src/ast_nodes.py
"""
AST node definitions for genome code generation.
"""
from typing import Any, List, Optional, Dict
from dataclasses import dataclass


@dataclass
class ASTNode:
    """Base class for all AST nodes"""
    type: str


@dataclass
class LiteralNode(ASTNode):
    """Literal value"""
    value: Any
    data_type: Optional[str] = None


@dataclass
class VariableNode(ASTNode):
    """Variable reference"""
    name: str


@dataclass
class BinaryOpNode(ASTNode):
    """Binary operation"""
    operator: str
    left: Dict[str, Any]
    right: Dict[str, Any]


@dataclass
class UnaryOpNode(ASTNode):
    """Unary operation"""
    operator: str
    operand: Dict[str, Any]


@dataclass
class IfNode(ASTNode):
    """If/else expression"""
    condition: Dict[str, Any]
    then_branch: Dict[str, Any]
    else_branch: Optional[Dict[str, Any]] = None


@dataclass
class BlockNode(ASTNode):
    """Block of statements"""
    statements: List[Dict[str, Any]]


@dataclass
class CallNode(ASTNode):
    """Function call"""
    function: str
    arguments: List[Dict[str, Any]]


@dataclass
class LetNode(ASTNode):
    """Variable declaration"""
    name: str
    value_type: Optional[str]
    value: Dict[str, Any]
    mutable: bool = False


@dataclass
class ReturnNode(ASTNode):
    """Return statement"""
    value: Optional[Dict[str, Any]] = None


@dataclass
class LoopNode(ASTNode):
    """Loop expression"""
    body: Dict[str, Any]


@dataclass
class MatchNode(ASTNode):
    """Match expression"""
    value: Dict[str, Any]
    arms: List[Dict[str, Any]]


def parse_ast_node(data: Dict[str, Any]) -> ASTNode:
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
