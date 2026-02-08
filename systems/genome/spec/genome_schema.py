# systems/genome/spec/genome_schema.py
"""
Genome Schema Specification

Defines the format for genetic program representations in Geometry OS.
"""
import json
from typing import Dict, List, Any, Optional
from dataclasses import dataclass, field
from enum import Enum


class GeneType(Enum):
    """Types of genes in the genome"""
    FUNCTION = "function"
    STRUCT = "struct"
    ENUM = "enum"
    TRAIT = "trait"
    IMPL = "impl"
    MODULE = "module"
    CONSTANT = "constant"


class ASTNodeType(Enum):
    """AST node types for gene bodies"""
    # Literals
    LITERAL = "literal"
    VARIABLE = "variable"

    # Operations
    BINARY_OP = "binary_op"
    UNARY_OP = "unary_op"

    # Control flow
    IF = "if"
    LOOP = "loop"
    MATCH = "match"
    BLOCK = "block"

    # Functions
    CALL = "call"
    RETURN = "return"

    # Declarations
    LET = "let"
    ASSIGN = "assign"


@dataclass
class Parameter:
    """Function or method parameter"""
    name: str
    type: str
    default: Optional[Any] = None


@dataclass
class Gene:
    """A single gene in the genome"""
    id: str
    type: GeneType
    name: str
    sequence: str  # DNA-like sequence for genetic operations

    # For functions
    parameters: List[Parameter] = field(default_factory=list)
    return_type: Optional[str] = None
    body: Optional[Dict[str, Any]] = None

    # For structs/traits
    fields: List[Dict[str, Any]] = field(default_factory=list)
    methods: List[str] = field(default_factory=list)

    # Metadata
    annotations: List[str] = field(default_factory=list)
    documentation: Optional[str] = None


@dataclass
class RegulatoryRegion:
    """Regulatory elements controlling gene expression"""
    promoters: List[str] = field(default_factory=list)  # Genes to activate
    enhancers: List[str] = field(default_factory=list)  # Genes to enhance
    suppressors: List[str] = field(default_factory=list)  # Genes to suppress

    # Conditional regulation
    conditional: List[Dict[str, Any]] = field(default_factory=list)


@dataclass
class Genome:
    """Complete genome specification"""
    version: str
    genes: List[Gene]
    regulatory_regions: RegulatoryRegion

    # Metadata
    author: Optional[str] = None
    description: Optional[str] = None
    created_at: Optional[str] = None
    generation: int = 0
    fitness_score: Optional[float] = None


class GenomeSchema:
    """Validator for genome specifications"""

    REQUIRED_FIELDS = {
        "version",
        "genes",
        "regulatory_regions"
    }

    GENE_REQUIRED_FIELDS = {
        "id",
        "type",
        "name",
        "sequence"
    }

    def validate(self, genome_data: Dict[str, Any]) -> List[str]:
        """
        Validate a genome specification.

        Returns:
            List of error messages (empty if valid)
        """
        errors = []

        # Check required top-level fields
        for field in self.REQUIRED_FIELDS:
            if field not in genome_data:
                errors.append(f"Missing required field: {field}")

        if errors:
            return errors

        # Validate genes
        if not isinstance(genome_data["genes"], list):
            errors.append("'genes' must be a list")
        else:
            for i, gene in enumerate(genome_data["genes"]):
                gene_errors = self._validate_gene(gene, i)
                errors.extend(gene_errors)

        # Validate regulatory regions
        reg_errors = self._validate_regulatory_regions(
            genome_data.get("regulatory_regions", {})
        )
        errors.extend(reg_errors)

        return errors

    def _validate_gene(self, gene: Dict[str, Any], index: int) -> List[str]:
        """Validate a single gene"""
        errors = []
        prefix = f"Gene {index}:"

        # Check required fields
        for field in self.GENE_REQUIRED_FIELDS:
            if field not in gene:
                errors.append(f"{prefix} Missing required field: {field}")

        if errors:
            return errors

        # Validate gene type
        try:
            GeneType(gene["type"])
        except ValueError:
            errors.append(f"{prefix} Invalid gene type: {gene['type']}")

        # Validate function-specific fields
        if gene["type"] == "function":
            if "parameters" in gene:
                if not isinstance(gene["parameters"], list):
                    errors.append(f"{prefix} 'parameters' must be a list")

            if "body" in gene and not isinstance(gene["body"], dict):
                errors.append(f"{prefix} 'body' must be an object")

        return errors

    def _validate_regulatory_regions(self, regions: Dict[str, Any]) -> List[str]:
        """Validate regulatory regions"""
        errors = []

        valid_keys = {"promoters", "enhancers", "suppressors", "conditional"}
        for key in regions:
            if key not in valid_keys:
                errors.append(f"Unknown regulatory region key: {key}")

        for key in ["promoters", "enhancers", "suppressors"]:
            if key in regions and not isinstance(regions[key], list):
                errors.append(f"'regulatory_regions.{key}' must be a list")

        return errors


def load_genome(path: str) -> Genome:
    """Load a genome from a JSON file"""
    with open(path, 'r') as f:
        data = json.load(f)

    schema = GenomeSchema()
    errors = schema.validate(data)

    if errors:
        raise ValueError(f"Invalid genome schema:\n" + "\n".join(errors))

    # Convert to Genome dataclass
    regulatory = RegulatoryRegion(
        promoters=data.get("regulatory_regions", {}).get("promoters", []),
        enhancers=data.get("regulatory_regions", {}).get("enhancers", []),
        suppressors=data.get("regulatory_regions", {}).get("suppressors", []),
        conditional=data.get("regulatory_regions", {}).get("conditional", [])
    )

    genes = []
    for gene_data in data["genes"]:
        gene = Gene(
            id=gene_data["id"],
            type=GeneType(gene_data["type"]),
            name=gene_data["name"],
            sequence=gene_data["sequence"],
            parameters=[
                Parameter(**p) for p in gene_data.get("parameters", [])
            ],
            return_type=gene_data.get("return_type"),
            body=gene_data.get("body"),
            fields=gene_data.get("fields", []),
            methods=gene_data.get("methods", []),
            annotations=gene_data.get("annotations", []),
            documentation=gene_data.get("documentation")
        )
        genes.append(gene)

    return Genome(
        version=data["version"],
        genes=genes,
        regulatory_regions=regulatory,
        author=data.get("author"),
        description=data.get("description"),
        created_at=data.get("created_at"),
        generation=data.get("generation", 0),
        fitness_score=data.get("fitness_score")
    )


def save_genome(genome: Genome, path: str):
    """Save a genome to a JSON file"""
    data = {
        "version": genome.version,
        "genes": [
            {
                "id": g.id,
                "type": g.type.value,
                "name": g.name,
                "sequence": g.sequence,
                "parameters": [
                    {"name": p.name, "type": p.type, "default": p.default}
                    for p in g.parameters
                ],
                "return_type": g.return_type,
                "body": g.body,
                "fields": g.fields,
                "methods": g.methods,
                "annotations": g.annotations,
                "documentation": g.documentation
            }
            for g in genome.genes
        ],
        "regulatory_regions": {
            "promoters": genome.regulatory_regions.promoters,
            "enhancers": genome.regulatory_regions.enhancers,
            "suppressors": genome.regulatory_regions.suppressors,
            "conditional": genome.regulatory_regions.conditional
        },
        "author": genome.author,
        "description": genome.description,
        "created_at": genome.created_at,
        "generation": genome.generation,
        "fitness_score": genome.fitness_score
    }

    with open(path, 'w') as f:
        json.dump(data, f, indent=2)
