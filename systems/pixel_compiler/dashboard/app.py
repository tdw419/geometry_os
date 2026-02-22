"""
PixelRTS Pattern Analysis Dashboard - Main Application
An interactive web dashboard for analyzing PixelRTS container images using Dash/Plotly.
"""

import io
import base64
import numpy as np
from typing import Optional, List, Dict, Any
from dash import Dash, html, dcc, Input, Output, State, callback_context, no_update
from dash.exceptions import PreventUpdate
import plotly.graph_objects as go
import cv2
from PIL import Image

# Import pattern detector
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent.parent))

from pattern_detector import PatternDetector, EdgeDetectionResult
from dashboard.layout import create_layout, create_error_alert, create_success_alert, create_info_alert
from dashboard.components import (
    create_stat_card, create_edge_density_chart,
    create_histogram_figure, create_2d_scatter_figure, create_heatmap_figure
)


def create_dashboard_app(title: str = "PixelRTS Pattern Analysis Dashboard", port: int = 8050):
    """
    Create and configure the Dash application.

    Args:
        title: Application title
        port: Port number for the dashboard server

    Returns:
        Dash: Configured Dash application instance
    """
    # Create Dash app with external stylesheets
    external_stylesheets = [
        "https://codepen.io/chriddyp/pen/bWLwgP.css",
        "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    ]

    app = Dash(
        __name__,
        external_stylesheets=external_stylesheets,
        suppress_callback_exceptions=True,
        title=title
    )

    app.title = title
    app.layout = create_layout()

    # Register all callbacks
    _register_callbacks(app)

    return app


def _register_callbacks(app: Dash):
    """
    Register all dashboard callbacks.

    Args:
        app: Dash application instance
    """
    # File upload callback
    @app.callback(
        Output("upload-status", "children"),
        Output("uploaded-image-data", "data"),
        Output("original-image-container", "children"),
        Input("upload-data", "contents"),
        State("upload-data", "filename"),
        prevent_initial_call=True
    )
    def handle_file_upload(contents: Optional[str], filename: Optional[str]):
        """Handle uploaded file and process image."""
        if contents is None:
            raise PreventUpdate

        try:
            # Parse base64 content
            content_type, content_string = contents.split(",")
            decoded = base64.b64decode(content_string)

            # Load image
            image = Image.open(io.BytesIO(decoded))
            image_array = np.array(image)

            # Create image preview
            image_preview = html.Img(
                src=contents,
                style={
                    "maxWidth": "100%",
                    "maxHeight": "500px",
                    "borderRadius": "8px",
                    "boxShadow": "0 2px 8px rgba(0,0,0,0.1)"
                }
            )

            # Store image data
            image_data = {
                "filename": filename,
                "width": image_array.shape[1],
                "height": image_array.shape[0],
                "channels": image_array.shape[2] if len(image_array.shape) > 2 else 1,
                "total_pixels": image_array.shape[0] * image_array.shape[1],
                "base64": contents
            }

            status = create_success_alert(f"Successfully loaded: {filename}")

            return status, image_data, image_preview

        except Exception as e:
            error_msg = create_error_alert(f"Failed to load image: {str(e)}")
            empty_preview = html.Div("Upload failed", style={
                "textAlign": "center",
                "padding": "50px",
                "color": "#dc3545"
            })
            return error_msg, None, empty_preview

    # Update quick stats when image is loaded
    @app.callback(
        Output("quick-stats", "children"),
        Input("uploaded-image-data", "data"),
        prevent_initial_call=True
    )
    def update_quick_stats(image_data: Optional[Dict[str, Any]]):
        """Update quick statistics cards."""
        if image_data is None:
            raise PreventUpdate

        return [
            create_stat_card(
                "Image Size",
                f"{image_data['width']}×{image_data['height']}",
                f"{image_data['width']} pixels wide",
                "🖼️"
            ),
            create_stat_card(
                "Total Pixels",
                f"{image_data['total_pixels']:,}",
                "All pixels",
                "📊"
            ),
            create_stat_card(
                "Channels",
                str(image_data['channels']),
                "Color channels",
                "🎨"
            ),
            create_stat_card(
                "Status",
                "Ready",
                "Ready for analysis",
                "✅"
            )
        ]

    # Show/hide Canny controls based on edge method selection
    @app.callback(
        Output("canny-controls", "style"),
        Input("edge-method", "value"),
        prevent_initial_call=True
    )
    def toggle_canny_controls(edge_method: str):
        """Show Canny controls only when Canny method is selected."""
        if edge_method == "canny":
            return {"display": "block", "marginTop": "15px"}
        return {"display": "none"}

    # Run analysis when button is clicked
    @app.callback(
        Output("pattern-overlay-container", "children"),
        Output("statistics-container", "children"),
        Output("analysis-results", "data"),
        Output("frequency-graph", "figure"),
        Input("run-analysis-btn", "n_clicks"),
        State("uploaded-image-data", "data"),
        State("analysis-methods", "value"),
        State("edge-method", "value"),
        State("canny-low-threshold", "value"),
        State("canny-high-threshold", "value"),
        prevent_initial_call=True
    )
    def run_analysis(n_clicks: int, image_data: Optional[Dict], methods: List[str],
                    edge_method: str, low_threshold: int, high_threshold: int):
        """Run pattern analysis based on selected methods."""
        if image_data is None or n_clicks == 0:
            raise PreventUpdate

        try:
            # Load image from base64
            content_type, content_string = image_data["base64"].split(",")
            decoded = base64.b64decode(content_string)
            image = Image.open(io.BytesIO(decoded))

            # Save to temp file for PatternDetector
            import tempfile
            with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as tmp:
                image.save(tmp.name)
                tmp_path = tmp.name

            # Initialize results
            results = {"methods": methods, "edge_method": edge_method}
            pattern_content = []
            stats_content = []
            freq_figure = go.Figure()

            # Edge detection
            if "edges" in methods:
                detector = PatternDetector(tmp_path)

                if edge_method == "sobel":
                    edge_result = detector.detect_edges_sobel()
                else:  # canny
                    edge_result = detector.detect_edges_canny(low_threshold, high_threshold)

                # Store edge results
                results["edges"] = {
                    "edge_count": edge_result.edge_count,
                    "edge_density": edge_result.edge_density,
                    "metadata": edge_result.metadata
                }

                # Create edge visualization
                edges_img = edge_result.edges
                _, buffer = cv2.imencode(".png", edges_img)
                edges_b64 = base64.b64encode(buffer).decode()

                pattern_content.append(html.Div([
                    html.H5(f"Edge Detection ({edge_method.upper()})"),
                    html.Img(src=f"data:image/png;base64,{edges_b64}",
                            style={"maxWidth": "100%", "borderRadius": "8px"}),
                    html.P(f"Edges: {edge_result.edge_count:,}, Density: {edge_result.edge_density:.4f}")
                ], style={"marginBottom": "20px"}))

                # Add statistics
                stats_content.append(html.Div([
                    html.H5("Edge Statistics"),
                    html.P(f"Edge Count: {edge_result.edge_count:,}"),
                    html.P(f"Edge Density: {edge_result.edge_density:.4f}")
                ], style={"padding": "15px", "backgroundColor": "#f8f9fa", "borderRadius": "8px"}))

            # Fourier transform
            if "fourier" in methods:
                img_array = np.array(image.convert("L"))
                f_transform = np.fft.fft2(img_array)
                f_shift = np.fft.fftshift(f_transform)
                magnitude_spectrum = 20 * np.log(np.abs(f_shift) + 1)

                # Create frequency visualization
                freq_figure = go.Figure(data=go.Heatmap(
                    z=magnitude_spectrum,
                    colorscale="Viridis"
                ))
                freq_figure.update_layout(
                    title="2D FFT Magnitude Spectrum",
                    template="plotly_white",
                    height=400
                )

                pattern_content.append(html.Div([
                    html.H5("Fourier Transform"),
                    html.P("Frequency analysis completed. See Frequency Analysis tab.")
                ], style={"marginBottom": "20px"}))

                # Store FFT results
                results["fourier"] = {
                    "mean_magnitude": float(np.mean(magnitude_spectrum)),
                    "max_magnitude": float(np.max(magnitude_spectrum))
                }

            # Clustering (placeholder)
            if "clusters" in methods:
                pattern_content.append(html.Div([
                    html.H5("Clustering Analysis"),
                    html.P("Clustering features coming soon...")
                ], style={"marginBottom": "20px"}))
                results["clusters"] = {"status": "coming_soon"}

            # Classification (placeholder)
            if "classify" in methods:
                pattern_content.append(html.Div([
                    html.H5("Classification"),
                    html.P("Classification features coming soon...")
                ], style={"marginBottom": "20px"}))
                results["classify"] = {"status": "coming_soon"}

            # Clean up temp file
            import os
            try:
                os.unlink(tmp_path)
            except:
                pass

            # Default stats if edge detection wasn't run
            if not stats_content:
                stats_content = [html.P("No statistics available")]

            # Default pattern content if no analysis ran
            if not pattern_content:
                pattern_content = [html.P("Select analysis methods and run analysis")]

            # Default frequency figure if FFT wasn't run
            if freq_figure == go.Figure():
                freq_figure = go.Figure()
                freq_figure.add_annotation(
                    text="Run Fourier analysis to see frequency spectrum",
                    xref="paper", yref="paper",
                    x=0.5, y=0.5, showarrow=False
                )

            return pattern_content, stats_content, results, freq_figure

        except Exception as e:
            error_div = create_error_alert(f"Analysis failed: {str(e)}")
            return error_div, [error_div], {"error": str(e)}, go.Figure()

    # Update frequency graph independently
    @app.callback(
        Output("frequency-graph", "figure", allow_duplicate=True),
        Input("analysis-results", "data"),
        prevent_initial_call=True
    )
    def update_frequency_graph(results: Optional[Dict]):
        """Update frequency analysis graph."""
        if results is None or "fourier" not in results:
            raise PreventUpdate

        # Return current figure (updated in main callback)
        raise PreventUpdate


def parse_uploaded_file(content: bytes, filename: str) -> Dict[str, Any]:
    """
    Parse uploaded file content and extract metadata.

    Args:
        content: Raw file content bytes
        filename: Original filename

    Returns:
        Dictionary with parsed metadata
    """
    try:
        image = Image.open(io.BytesIO(content))
        image_array = np.array(image)

        return {
            "filename": filename,
            "width": image_array.shape[1],
            "height": image_array.shape[0],
            "channels": image_array.shape[2] if len(image_array.shape) > 2 else 1,
            "total_pixels": image_array.shape[0] * image_array.shape[1],
            "dtype": str(image_array.dtype),
            "format": image.format
        }
    except Exception as e:
        return {"error": str(e)}


def perform_edge_analysis(image_path: str, method: str = "sobel",
                          low_threshold: int = 50, high_threshold: int = 150) -> EdgeDetectionResult:
    """
    Perform edge detection analysis on an image.

    Args:
        image_path: Path to image file
        method: Edge detection method ("sobel" or "canny")
        low_threshold: Low threshold for Canny
        high_threshold: High threshold for Canny

    Returns:
        EdgeDetectionResult with analysis results
    """
    detector = PatternDetector(image_path)

    if method == "sobel":
        return detector.detect_edges_sobel()
    else:
        return detector.detect_edges_canny(low_threshold, high_threshold)


def run_dashboard(host: str = "127.0.0.1", port: int = 8050, debug: bool = True):
    """
    Run the dashboard server.

    Args:
        host: Host address to bind to
        port: Port number to listen on
        debug: Enable debug mode
    """
    app = create_dashboard_app(port=port)

    print(f"\n{'='*60}")
    print(f"PixelRTS Pattern Analysis Dashboard")
    print(f"{'='*60}")
    print(f"Starting server on http://{host}:{port}")
    print(f"Press Ctrl+C to stop")
    print(f"{'='*60}\n")

    app.run_server(host=host, port=port, debug=debug)


if __name__ == "__main__":
    run_dashboard()
