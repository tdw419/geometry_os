"""
Command-line interface for genome operations.
"""
import sys
import argparse
import json
from pathlib import Path

# Import from the same directory
from genome_schema import load_genome, save_genome, GenomeSchema
from rust_generator import RustCodeGenerator
from genetic_ops import (
    mutate_sequence, crossover_genomes, evolve_population,
    PointMutationConfig, CrossoverConfig, SelectionConfig
)


def cmd_validate(args):
    """Validate a genome file"""
    schema = GenomeSchema()

    try:
        with open(args.input, 'r') as f:
            data = json.load(f)

        errors = schema.validate(data)

        if errors:
            print("❌ Genome validation failed:")
            for error in errors:
                print(f"  - {error}")
            return 1
        else:
            print("✅ Genome is valid")
            return 0

    except Exception as e:
        print(f"❌ Error loading genome: {e}")
        return 1


def cmd_generate(args):
    """Generate Rust code from genome"""
    try:
        genome = load_genome(args.input)
        generator = RustCodeGenerator()

        code = generator.generate(genome)

        if args.output:
            with open(args.output, 'w') as f:
                f.write(code)
            print(f"✅ Generated Rust code: {args.output}")
        else:
            print(code)

        return 0

    except Exception as e:
        print(f"❌ Error generating code: {e}")
        return 1


def cmd_mutate(args):
    """Mutate a genome"""
    try:
        genome = load_genome(args.input)

        config = PointMutationConfig(
            mutation_rate=args.mutation_rate
        )

        from genetic_ops import mutate_gene
        mutated_genes = []
        for gene in genome.genes:
            mutated = mutate_gene(gene, config)
            mutated_genes.append(mutated)

        genome.genes = mutated_genes
        genome.generation += 1

        output = args.output or f"mutated_{Path(args.input).name}"
        save_genome(genome, output)
        print(f"✅ Mutated genome saved: {output}")

        return 0

    except Exception as e:
        print(f"❌ Error mutating genome: {e}")
        return 1


def cmd_crossover(args):
    """Crossover two genomes"""
    try:
        parent1 = load_genome(args.parent1)
        parent2 = load_genome(args.parent2)

        config = CrossoverConfig(
            method=args.method,
            gene_crossover_rate=args.crossover_rate
        )

        child = crossover_genomes(parent1, parent2, config)

        output = args.output or "offspring.genome.json"
        save_genome(child, output)
        print(f"✅ Offspring genome saved: {output}")

        return 0

    except Exception as e:
        print(f"❌ Error crossing genomes: {e}")
        return 1


def cmd_info(args):
    """Display genome information"""
    try:
        genome = load_genome(args.input)

        print(f"Genome Information")
        print(f"=" * 50)
        print(f"Version: {genome.version}")
        print(f"Generation: {genome.generation}")
        print(f"Author: {genome.author or 'Unknown'}")
        print(f"Description: {genome.description or 'None'}")
        print(f"Fitness Score: {genome.fitness_score or 'Not evaluated'}")
        print(f"")
        print(f"Genes: {len(genome.genes)}")
        for gene in genome.genes:
            print(f"  - {gene.type.value}: {gene.name} ({gene.id})")
        print(f"")
        print(f"Regulatory Regions:")
        print(f"  - Promoters: {len(genome.regulatory_regions.promoters)}")
        print(f"  - Enhancers: {len(genome.regulatory_regions.enhancers)}")
        print(f"  - Suppressors: {len(genome.regulatory_regions.suppressors)}")

        return 0

    except Exception as e:
        print(f"❌ Error loading genome: {e}")
        return 1


def main():
    parser = argparse.ArgumentParser(
        description="Geometry OS Genome Tools",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  genome validate input.genome.json
  genome generate input.genome.json -o output.rs
  genome mutate input.genome.json --mutation-rate 0.1 -o mutated.json
  genome crossover parent1.json parent2.json -o offspring.json
  genome info input.genome.json
        """
    )

    subparsers = parser.add_subparsers(dest='command', help='Command to run')

    # Validate command
    validate_parser = subparsers.add_parser('validate', help='Validate genome file')
    validate_parser.add_argument('input', help='Input genome file')

    # Generate command
    generate_parser = subparsers.add_parser('generate', help='Generate Rust code')
    generate_parser.add_argument('input', help='Input genome file')
    generate_parser.add_argument('-o', '--output', help='Output Rust file')

    # Mutate command
    mutate_parser = subparsers.add_parser('mutate', help='Mutate genome')
    mutate_parser.add_argument('input', help='Input genome file')
    mutate_parser.add_argument('-o', '--output', help='Output genome file')
    mutate_parser.add_argument('--mutation-rate', type=float, default=0.01,
                               help='Mutation rate (default: 0.01)')

    # Crossover command
    crossover_parser = subparsers.add_parser('crossover', help='Crossover genomes')
    crossover_parser.add_argument('parent1', help='First parent genome')
    crossover_parser.add_argument('parent2', help='Second parent genome')
    crossover_parser.add_argument('-o', '--output', help='Offspring genome file')
    crossover_parser.add_argument('--method', default='single_point',
                                  choices=['single_point', 'two_point', 'uniform'],
                                  help='Crossover method')
    crossover_parser.add_argument('--crossover-rate', type=float, default=0.5,
                                  help='Gene crossover rate')

    # Info command
    info_parser = subparsers.add_parser('info', help='Display genome info')
    info_parser.add_argument('input', help='Input genome file')

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    # Dispatch
    handlers = {
        'validate': cmd_validate,
        'generate': cmd_generate,
        'mutate': cmd_mutate,
        'crossover': cmd_crossover,
        'info': cmd_info,
    }

    return handlers[args.command](args)


if __name__ == '__main__':
    sys.exit(main())
