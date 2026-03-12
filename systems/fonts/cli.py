"""
GEOS Font CLI - Agent-controllable font rendering interface

Usage:
    geos-font status
    geos-font load /path/to/font.ttf --size=14
    geos-font render "Hello World" --output=hello.rgba
    geos-font list
"""

import sys
import json
import click
from pathlib import Path

# Add parent to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.fonts.font_renderer import FontRenderer, find_system_font


# Global renderer instance
_renderer: FontRenderer = None


def get_renderer() -> FontRenderer:
    """Get or create global renderer instance."""
    global _renderer
    if _renderer is None:
        _renderer = FontRenderer()
    return _renderer


@click.group(invoke_without_command=True)
@click.option('--json', 'output_json', is_flag=True, help='JSON output for agents')
@click.pass_context
def cli(ctx, output_json):
    """GEOS Font - Font rendering for Geometry OS."""
    ctx.ensure_object(dict)
    ctx.obj['json'] = output_json

    if ctx.invoked_subcommand is None:
        # Default to status
        ctx.invoke(status)


@cli.command()
@click.option('--json', 'output_json', is_flag=True, help='JSON output for agents')
@click.pass_context
def status(ctx, output_json):
    """Show current font renderer status."""
    renderer = get_renderer()
    stat = renderer.get_status()

    use_json = output_json or ctx.obj.get('json', False)

    if use_json:
        click.echo(json.dumps(stat, indent=2))
    else:
        click.echo("\n" + "=" * 50)
        click.echo("GEOS FONT RENDERER STATUS")
        click.echo("=" * 50 + "\n")

        if stat['is_loaded']:
            click.echo(f"Font:      {stat['family_name']} ({stat['style_name']})")
            click.echo(f"Path:      {stat['font_path']}")
            click.echo(f"Size:      {stat['size']}px")
        else:
            click.echo("No font loaded")

        click.echo(f"\nCache:     {stat['cached_glyphs']}/{stat['cache_size']} glyphs")
        click.echo(f"Hit rate:  {stat['cache_hit_rate']}%")
        click.echo(f"Renders:   {stat['render_count']}")
        click.echo()


@cli.command()
@click.argument('font_path', required=False)
@click.option('--size', default=14, help='Font size in pixels')
@click.option('--name', default=None, help='Search for font by name')
@click.pass_context
def load(ctx, font_path, size, name):
    """Load a font file."""
    renderer = get_renderer()

    # Find font by name if path not provided
    if font_path is None:
        if name:
            font_path = find_system_font(name)
        else:
            font_path = find_system_font("monospace")

        if font_path is None:
            msg = "No font found. Specify path or install fonts."
            if ctx.obj['json']:
                click.echo(json.dumps({"error": msg}))
            else:
                click.echo(f"Error: {msg}")
            sys.exit(1)

    try:
        result = renderer.load(font_path, size)

        if ctx.obj['json']:
            click.echo(json.dumps(result, indent=2))
        else:
            click.echo(f"Loaded: {result['family_name']} ({result['style_name']})")
            click.echo(f"Path: {result['font_path']}")
            click.echo(f"Size: {result['size']}px")
            click.echo(f"Glyphs: {result['num_glyphs']}")
    except Exception as e:
        if ctx.obj['json']:
            click.echo(json.dumps({"error": str(e)}))
        else:
            click.echo(f"Error: {e}")
        sys.exit(1)


@cli.command()
@click.argument('text')
@click.option('--output', '-o', default=None, help='Output file path')
@click.option('--font', 'font_name', default=None, help='Font to use')
@click.option('--size', default=14, help='Font size')
@click.pass_context
def render(ctx, text, output, font_name, size):
    """Render text to RGBA pixels."""
    renderer = get_renderer()

    # Load font if needed
    if not renderer.is_loaded:
        font_path = find_system_font(font_name or "monospace")
        if font_path:
            renderer.load(font_path, size)
        else:
            msg = "No font loaded. Use 'load' command first."
            if ctx.obj['json']:
                click.echo(json.dumps({"error": msg}))
            else:
                click.echo(f"Error: {msg}")
            sys.exit(1)

    try:
        pixels, width, height = renderer.render_text(text)

        result = {
            "text": text,
            "width": width,
            "height": height,
            "bytes": len(pixels),
            "format": "rgba8",
        }

        if output:
            # Write raw RGBA to file
            with open(output, 'wb') as f:
                f.write(pixels)
            result["output_path"] = output

        if ctx.obj['json']:
            # Don't include pixels in JSON output (too large)
            click.echo(json.dumps(result, indent=2))
        else:
            click.echo(f"Rendered: '{text}'")
            click.echo(f"Size: {width}x{height} ({len(pixels)} bytes)")
            if output:
                click.echo(f"Saved: {output}")
    except Exception as e:
        if ctx.obj['json']:
            click.echo(json.dumps({"error": str(e)}))
        else:
            click.echo(f"Error: {e}")
        sys.exit(1)


@cli.command()
@click.option('--json', 'output_json', is_flag=True, help='JSON output for agents')
@click.pass_context
def list_fonts(ctx, output_json):
    """List available system fonts."""
    import os

    use_json = output_json or ctx.obj.get('json', False)

    font_dirs = [
        "/usr/share/fonts",
        "/usr/local/share/fonts",
        os.path.expanduser("~/.local/share/fonts"),
    ]

    fonts = []

    for font_dir in font_dirs:
        if not os.path.exists(font_dir):
            continue

        for root, dirs, files in os.walk(font_dir):
            for file in files:
                if file.endswith(('.ttf', '.otf', '.TTF', '.OTF')):
                    fonts.append(os.path.join(root, file))

    if use_json:
        click.echo(json.dumps({"fonts": fonts, "count": len(fonts)}, indent=2))
    else:
        click.echo(f"\nFound {len(fonts)} fonts:\n")
        for font in sorted(fonts)[:20]:  # Show first 20
            click.echo(f"  {font}")
        if len(fonts) > 20:
            click.echo(f"\n  ... and {len(fonts) - 20} more")


@cli.command()
@click.argument('text')
@click.pass_context
def metrics(ctx, text):
    """Get text metrics without rendering."""
    renderer = get_renderer()

    if not renderer.is_loaded:
        click.echo("Error: No font loaded. Use 'load' command first.")
        sys.exit(1)

    try:
        m = renderer.get_text_metrics(text)

        result = {
            "text": text,
            "width": m.width,
            "height": m.height,
            "baseline": m.baseline,
        }

        if ctx.obj['json']:
            click.echo(json.dumps(result, indent=2))
        else:
            click.echo(f"Text: '{text}'")
            click.echo(f"Width: {m.width}px")
            click.echo(f"Height: {m.height}px")
            click.echo(f"Baseline: {m.baseline}px")
    except Exception as e:
        if ctx.obj['json']:
            click.echo(json.dumps({"error": str(e)}))
        else:
            click.echo(f"Error: {e}")
        sys.exit(1)


@cli.command()
@click.option('--json', 'output_json', is_flag=True, help='JSON output for agents')
@click.pass_context
def clear_cache(ctx, output_json):
    """Clear glyph cache."""
    renderer = get_renderer()
    count = renderer.clear_cache()

    use_json = output_json or ctx.obj.get('json', False)

    if use_json:
        click.echo(json.dumps({"cleared": count}))
    else:
        click.echo(f"Cleared {count} cached glyphs")


if __name__ == '__main__':
    cli()
