"""
Layout configuration for PixelRTS Dashboard.
Defines the overall page structure and component arrangement.
"""

from dash import html, dcc
from dashboard.components import (
    create_upload_component,
    create_analysis_controls,
    create_tabs,
    create_stat_card
)


def create_layout():
    """
    Create the main dashboard layout.

    Returns:
        html.Div: Root layout component containing all UI elements
    """
    return html.Div([
        # Header
        html.Header([
            html.H1("PixelRTS Pattern Analysis Dashboard", style={
                "textAlign": "center",
                "color": "#007bff",
                "marginBottom": "10px"
            }),
            html.P("Upload and analyze PixelRTS container images", style={
                "textAlign": "center",
                "color": "#6c757d",
                "marginBottom": "0px"
            })
        ], style={
            "padding": "30px 20px",
            "background": "linear-gradient(135deg, #667eea 0%, #764ba2 100%)",
            "color": "white",
            "borderRadius": "0 0 15px 15px",
            "boxShadow": "0 4px 6px rgba(0,0,0,0.1)"
        }),

        # Main content area
        html.Main([
            html.Div([
                # Upload section
                html.Div([
                    html.H3("Upload Image", style={"marginBottom": "15px"}),
                    create_upload_component(),
                    html.Div(id="upload-status", style={
                        "marginTop": "10px",
                        "textAlign": "center",
                        "color": "#6c757d"
                    })
                ], style={
                    "flex": "1",
                    "minWidth": "300px",
                    "marginRight": "20px"
                }),

                # Analysis controls
                html.Div([
                    html.H3("Analysis Controls", style={"marginBottom": "15px"}),
                    create_analysis_controls()
                ], style={
                    "flex": "1",
                    "minWidth": "300px"
                })
            ], style={
                "display": "flex",
                "gap": "20px",
                "margin": "20px",
                "flexWrap": "wrap"
            }),

            # Quick stats cards
            html.Div(id="quick-stats", style={
                "display": "grid",
                "gridTemplateColumns": "repeat(auto-fit, minmax(200px, 1fr))",
                "gap": "15px",
                "margin": "0 20px 20px 20px"
            }, children=[
                create_stat_card("Image Size", "N/A", "Width × Height", "🖼️"),
                create_stat_card("Total Pixels", "N/A", "Pixel count", "📊"),
                create_stat_card("Channels", "N/A", "Color channels", "🎨"),
                create_stat_card("Status", "Ready", "Upload to begin", "✅")
            ]),

            # Tabbed content area
            html.Div([
                create_tabs()
            ], style={
                "margin": "0 20px 20px 20px"
            }),

            # Loading indicator
            dcc.Loading(
                id="loading-indicator",
                type="default",
                children=html.Div(id="loading-output")
            ),

            # Hidden stores for state management
            dcc.Store(id="uploaded-image-data"),
            dcc.Store(id="analysis-results"),
            dcc.Interval(
                id="interval-component",
                interval=2*1000,  # Update every 2 seconds
                n_intervals=0,
                disabled=True
            )
        ], style={
            "maxWidth": "1400px",
            "margin": "0 auto",
            "padding": "20px"
        }),

        # Footer
        html.Footer([
            html.P("PixelRTS Dashboard - Powered by Dash & Plotly", style={
                "textAlign": "center",
                "color": "#6c757d",
                "marginBottom": "0px"
            })
        ], style={
            "padding": "20px",
            "backgroundColor": "#f8f9fa",
            "borderTop": "1px solid #dee2e6",
            "marginTop": "40px"
        })
    ], style={
        "minHeight": "100vh",
        "backgroundColor": "#f5f5f5",
        "fontFamily": "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"
    })


def create_error_alert(message: str):
    """
    Create an error alert component.

    Args:
        message: Error message to display

    Returns:
        html.Div: Alert component
    """
    return html.Div([
        html.Strong("Error: "),
        html.Span(message)
    ], style={
        "padding": "15px",
        "backgroundColor": "#f8d7da",
        "borderColor": "#f5c6cb",
        "color": "#721c24",
        "borderRadius": "5px",
        "margin": "20px"
    })


def create_success_alert(message: str):
    """
    Create a success alert component.

    Args:
        message: Success message to display

    Returns:
        html.Div: Alert component
    """
    return html.Div([
        html.Strong("Success: "),
        html.Span(message)
    ], style={
        "padding": "15px",
        "backgroundColor": "#d4edda",
        "borderColor": "#c3e6cb",
        "color": "#155724",
        "borderRadius": "5px",
        "margin": "20px"
    })


def create_info_alert(message: str):
    """
    Create an info alert component.

    Args:
        message: Info message to display

    Returns:
        html.Div: Alert component
    """
    return html.Div([
        html.Strong("Info: "),
        html.Span(message)
    ], style={
        "padding": "15px",
        "backgroundColor": "#d1ecf1",
        "borderColor": "#bee5eb",
        "color": "#0c5460",
        "borderRadius": "5px",
        "margin": "20px"
    })
