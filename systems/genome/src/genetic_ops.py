"""
Genetic operators for genome evolution.

Implements mutation, crossover, and selection operations
for evolving genome specifications.
"""
import random
from typing import List, Optional, Tuple
from dataclasses import dataclass, field
from .genome_schema import Genome, Gene, GeneType, RegulatoryRegion


@dataclass
class PointMutationConfig:
    """Configuration for point mutations"""
    mutation_rate: float = 0.01  # Probability per base
    nucleotides: str = "ATCG"

    def __post_init__(self):
        if not 0 <= self.mutation_rate <= 1:
            raise ValueError("mutation_rate must be between 0 and 1")


@dataclass
class CrossoverConfig:
    """Configuration for crossover operations"""
    method: str = "single_point"  # single_point, two_point, uniform
    gene_crossover_rate: float = 0.5
    sequence_crossover_rate: float = 0.3


@dataclass
class SelectionConfig:
    """Configuration for selection"""
    method: str = "tournament"  # tournament, roulette, rank
    tournament_size: int = 3
    elitism_count: int = 1


def mutate_sequence(sequence: str, config: PointMutationConfig) -> str:
    """
    Apply point mutations to a DNA sequence.

    Args:
        sequence: Original DNA sequence
        config: Mutation configuration

    Returns:
        Mutated sequence
    """
    result = []
    for base in sequence:
        if random.random() < config.mutation_rate:
            # Mutate to different nucleotide
            choices = [n for n in config.nucleotides if n != base]
            result.append(random.choice(choices))
        else:
            result.append(base)
    return "".join(result)


def mutate_gene(gene: Gene, config: PointMutationConfig) -> Gene:
    """Apply mutations to a gene"""
    # Mutate sequence
    new_sequence = mutate_sequence(gene.sequence, config)

    # Occasionally mutate body (swap operators, change values)
    new_body = gene.body
    if gene.body and random.random() < config.mutation_rate * 10:
        new_body = mutate_ast(gene.body, config)

    return Gene(
        id=gene.id,
        type=gene.type,
        name=gene.name,
        sequence=new_sequence,
        parameters=gene.parameters,
        return_type=gene.return_type,
        body=new_body,
        fields=gene.fields,
        methods=gene.methods,
        annotations=gene.annotations,
        documentation=gene.documentation
    )


def mutate_ast(node: dict, config: PointMutationConfig) -> dict:
    """Recursively mutate an AST node"""
    if not isinstance(node, dict):
        return node

    result = dict(node)

    node_type = node.get("type", "")

    # Swap operators
    if node_type == "binary_op":
        if random.random() < config.mutation_rate * 5:
            operators = ["+", "-", "*", "/", "%"]
            current = node.get("operator", "+")
            if current in operators:
                new_op = random.choice(operators)
                result["operator"] = new_op

    # Mutate numeric literals
    elif node_type == "literal":
        value = node.get("value")
        if isinstance(value, (int, float)):
            if random.random() < config.mutation_rate * 3:
                perturbation = random.uniform(-0.1, 0.1) * value
                result["value"] = value + perturbation

    # Recursively mutate child nodes
    for key in ["left", "right", "condition", "then_branch", "else_branch",
                "body", "value", "operand"]:
        if key in result and isinstance(result[key], dict):
            result[key] = mutate_ast(result[key], config)

    return result


def crossover_sequences(seq1: str, seq2: str, point: Optional[int] = None) -> Tuple[str, str]:
    """
    Perform single-point crossover on two sequences.

    Args:
        seq1: First sequence
        seq2: Second sequence
        point: Crossover point (None for random)

    Returns:
        Tuple of (new_seq1, new_seq2)
    """
    min_len = min(len(seq1), len(seq2))
    if point is None:
        point = random.randint(0, min_len)

    new_seq1 = seq1[:point] + seq2[point:]
    new_seq2 = seq2[:point] + seq1[point:]

    return new_seq1, new_seq2


def crossover_genes(gene1: Gene, gene2: Gene, config: CrossoverConfig) -> List[Gene]:
    """Crossover two genes"""
    if gene1.id != gene2.id:
        # Different genes - can't crossover meaningfully
        return [gene1, gene2] if random.random() < 0.5 else [gene2, gene1]

    # Crossover sequences
    seq1, seq2 = crossover_sequences(gene1.sequence, gene2.sequence)

    # Crossover bodies if both exist
    body1, body2 = gene1.body, gene2.body
    if body1 and body2 and random.random() < config.sequence_crossover_rate:
        body1, body2 = crossover_bodies(body1, body2)

    return [
        Gene(
            id=gene1.id,
            type=gene1.type,
            name=gene1.name,
            sequence=seq1,
            parameters=gene1.parameters,
            return_type=gene1.return_type,
            body=body1,
            fields=gene1.fields,
            methods=gene1.methods,
            annotations=gene1.annotations,
            documentation=gene1.documentation
        ),
        Gene(
            id=gene2.id,
            type=gene2.type,
            name=gene2.name,
            sequence=seq2,
            parameters=gene2.parameters,
            return_type=gene2.return_type,
            body=body2,
            fields=gene2.fields,
            methods=gene2.methods,
            annotations=gene2.annotations,
            documentation=gene2.documentation
        )
    ]


def crossover_bodies(body1: dict, body2: dict) -> Tuple[dict, dict]:
    """Crossover two AST bodies"""
    # For now, just swap them
    # More sophisticated crossover could swap subtrees
    if random.random() < 0.5:
        return body2, body1
    return body1, body2


def crossover_genomes(genome1: Genome, genome2: Genome,
                      config: Optional[CrossoverConfig] = None,
                      crossover_point: float = 0.5) -> Genome:
    """
    Crossover two genomes to create offspring.

    Args:
        genome1: First parent genome
        genome2: Second parent genome
        config: Crossover configuration
        crossover_point: Fraction of genes to take from first parent (0-1)

    Returns:
        Child genome
    """
    if config is None:
        config = CrossoverConfig()

    # Get gene maps
    genes1 = {g.id: g for g in genome1.genes}
    genes2 = {g.id: g for g in genome2.genes}

    # Determine which genes come from which parent
    all_gene_ids = set(genes1.keys()) | set(genes2.keys())

    child_genes = []
    for gene_id in all_gene_ids:
        has_in_1 = gene_id in genes1
        has_in_2 = gene_id in genes2

        if has_in_1 and has_in_2:
            # Gene exists in both - potentially crossover
            if random.random() < config.gene_crossover_rate:
                crossed = crossover_genes(genes1[gene_id], genes2[gene_id], config)
                child_genes.extend(crossed)
            else:
                # Take from one parent
                if random.random() < crossover_point:
                    child_genes.append(genes1[gene_id])
                else:
                    child_genes.append(genes2[gene_id])
        elif has_in_1:
            child_genes.append(genes1[gene_id])
        else:
            child_genes.append(genes2[gene_id])

    # Crossover regulatory regions
    child_regulatory = RegulatoryRegion(
        promoters=list(set(genome1.regulatory_regions.promoters) |
                       set(genome2.regulatory_regions.promoters)),
        enhancers=list(set(genome1.regulatory_regions.enhancers) |
                       set(genome2.regulatory_regions.enhancers)),
        suppressors=[]  # Don't inherit suppressors
    )

    return Genome(
        version=genome1.version,
        genes=child_genes,
        regulatory_regions=child_regulatory,
        author=f"Cross of {genome1.author or '?'} and {genome2.author or '?'}",
        description=f"Offspring of genome crossover",
        created_at=None,
        generation=max(genome1.generation, genome2.generation) + 1,
        fitness_score=None
    )


def tournament_select(population: List[Genome],
                      config: SelectionConfig) -> Genome:
    """
    Select a genome using tournament selection.

    Args:
        population: List of genomes to select from
        config: Selection configuration

    Returns:
        Selected genome
    """
    if config.method != "tournament":
        raise ValueError(f"Unsupported selection method: {config.method}")

    # Randomly sample tournament_size individuals
    tournament = random.sample(population, min(config.tournament_size, len(population)))

    # Return the one with highest fitness
    return max(tournament, key=lambda g: g.fitness_score or 0)


def roulette_select(population: List[Genome],
                    config: SelectionConfig) -> Genome:
    """
    Select a genome using roulette wheel selection.

    Args:
        population: List of genomes to select from
        config: Selection configuration

    Returns:
        Selected genome
    """
    # Calculate total fitness
    total_fitness = sum(max(0, g.fitness_score or 0) for g in population)

    if total_fitness == 0:
        return random.choice(population)

    # Select based on fitness proportion
    r = random.uniform(0, total_fitness)
    cumsum = 0

    for genome in population:
        cumsum += max(0, genome.fitness_score or 0)
        if cumsum >= r:
            return genome

    return population[-1]


def evolve_population(population: List[Genome],
                      mutation_config: Optional[PointMutationConfig] = None,
                      crossover_config: Optional[CrossoverConfig] = None,
                      selection_config: Optional[SelectionConfig] = None,
                      population_size: int = None) -> List[Genome]:
    """
    Evolve a population of genomes.

    Args:
        population: Current population
        mutation_config: Mutation configuration
        crossover_config: Crossover configuration
        selection_config: Selection configuration
        population_size: Target population size

    Returns:
        Next generation population
    """
    if population_size is None:
        population_size = len(population)

    if mutation_config is None:
        mutation_config = PointMutationConfig()
    if crossover_config is None:
        crossover_config = CrossoverConfig()
    if selection_config is None:
        selection_config = SelectionConfig()

    new_population = []

    # Elitism - keep best individuals
    if selection_config.elitism_count > 0:
        sorted_pop = sorted(population, key=lambda g: g.fitness_score or 0, reverse=True)
        new_population.extend(sorted_pop[:selection_config.elitism_count])

    # Generate offspring
    while len(new_population) < population_size:
        # Select parents
        if selection_config.method == "tournament":
            parent1 = tournament_select(population, selection_config)
            parent2 = tournament_select(population, selection_config)
        elif selection_config.method == "roulette":
            parent1 = roulette_select(population, selection_config)
            parent2 = roulette_select(population, selection_config)
        else:
            parent1 = random.choice(population)
            parent2 = random.choice(population)

        # Crossover
        child = crossover_genomes(parent1, parent2, crossover_config)

        # Mutate
        child_genes = []
        for gene in child.genes:
            mutated = mutate_gene(gene, mutation_config)
            child_genes.append(mutated)
        child.genes = child_genes

        new_population.append(child)

    return new_population[:population_size]
