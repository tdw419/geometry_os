"""
Dashboard components for PixelRTS pattern analysis.
Provides reusable UI components for the interactive dashboard.
"""

from dash import dcc, html, dash_table
import plotly.graph_objects as go
import plotly.express as px


def create_upload_component():
    """
    Create file upload component with drag-drop support.

    Returns:
        dcc.Upload: Upload component for RTS/PNG files
    """
    return dcc.Upload(
        id="upload-data",
        children=html.Div([
            html.I(className="fas fa-cloud-upload-alt", style={"fontSize": 48, "marginBottom": "10px"}),
            html.Br(),
            html.Div("Drag and Drop or ", style={"fontSize": 16}),
            html.A("Select Files", style={"color": "#0066cc", "fontWeight": "bold"})
        ]),
        style={
            "width": "100%",
            "height": "120px",
            "lineHeight": "120px",
            "borderWidth": "2px",
            "borderStyle": "dashed",
            "borderRadius": "10px",
            "textAlign": "center",
            "margin": "20px 0",
            "backgroundColor": "#f8f9fa",
            "borderColor": "#6c757d"
        },
        multiple=False,
        accept=".png,.rts.png"
    )


def create_analysis_controls():
    """
    Create analysis control panel with method checkboxes and options.

    Returns:
        html.Div: Control panel with checkboxes and dropdowns
    """
    return html.Div([
        html.H5("Analysis Methods", style={"marginBottom": "15px"}),
        html.Div([
            html.Div([
                dcc.Checklist(
                    id="analysis-methods",
                    options=[
                        {"label": "Edge Detection", "value": "edges"},
                        {"label": "Fourier Transform", "value": "fourier"},
                        {"label": "Clustering", "value": "clusters"},
                        {"label": "Classification", "value": "classify"}
                    ],
                    value=["edges"],
                    inline=True,
                    style={"display": "flex", "flexDirection": "column", "gap": "8px"}
                )
            ], style={"flex": "1"}),

            html.Div([
                html.Label("Edge Detection Method:", style={"fontWeight": "bold", "marginBottom": "5px"}),
                dcc.Dropdown(
                    id="edge-method",
                    options=[
                        {"label": "Sobel Operator", "value": "sobel"},
                        {"label": "Canny Detector", "value": "canny"}
                    ],
                    value="sobel",
                    clearable=False,
                    style={"backgroundColor": "white"}
                )
            ], style={"flex": "1", "marginLeft": "20px"})
        ], style={"display": "flex", "gap": "20px"}),

        html.Div([
            html.Label("Canny Thresholds:", style={"fontWeight": "bold", "marginTop": "15px"}),
            html.Div([
                html.Div([
                    html.Label("Low:", style={"fontSize": 12}),
                    dcc.Input(
                        id="canny-low-threshold",
                        type="number",
                        value=50,
                        min=0,
                        max=255,
                        style={"width": "80px", "marginRight": "10px"}
                    )
                ], style={"display": "inline-block", "marginRight": "20px"}),
                html.Div([
                    html.Label("High:", style={"fontSize": 12}),
                    dcc.Input(
                        id="canny-high-threshold",
                        type="number",
                        value=150,
                        min=0,
                        max=255,
                        style={"width": "80px"}
                    )
                ], style={"display": "inline-block"})
            ])
        ], id="canny-controls", style={"display": "none"}),  # Hidden by default

        html.Button(
            "Run Analysis",
            id="run-analysis-btn",
            n_clicks=0,
            style={
                "marginTop": "15px",
                "padding": "10px 20px",
                "backgroundColor": "#007bff",
                "color": "white",
                "border": "none",
                "borderRadius": "5px",
                "cursor": "pointer",
                "fontSize": "14px",
                "fontWeight": "bold"
            }
        )
    ], style={
        "padding": "20px",
        "backgroundColor": "#ffffff",
        "borderRadius": "8px",
        "boxShadow": "0 2px 4px rgba(0,0,0,0.1)",
        "marginBottom": "20px"
    })


def create_tabs():
    """
    Create main tabbed interface for different analysis views.

    Returns:
        dcc.Tabs: Tabs component with all analysis tabs
    """
    return dcc.Tabs(
        id="main-tabs",
        value="image-tab",
        children=[
            create_image_tab(),
            create_pattern_tab(),
            create_statistics_tab(),
            create_frequency_tab()
        ],
        style={"backgroundColor": "#f8f9fa"}
    )


def create_image_tab():
    """
    Create image view tab for displaying uploaded images.

    Returns:
        dcc.Tab: Tab component for image display
    """
    return dcc.Tab(
        label="Image View",
        value="image-tab",
        children=html.Div([
            html.Div([
                html.H4("Original Image", style={"textAlign": "center", "marginBottom": "15px"}),
                html.Div(
                    id="original-image-container",
                    style={
                        "textAlign": "center",
                        "padding": "20px",
                        "backgroundColor": "#ffffff",
                        "borderRadius": "8px",
                        "minHeight": "400px",
                        "display": "flex",
                        "alignItems": "center",
                        "justifyContent": "center"
                    },
                    children="Upload an image to begin analysis"
                )
            ])
        ], style={"padding": "20px"})
    )


def create_pattern_tab():
    """
    Create pattern overlay tab for displaying analysis results.

    Returns:
        dcc.Tab: Tab component for pattern visualization
    """
    return dcc.Tab(
        label="Pattern Overlay",
        value="pattern-tab",
        children=html.Div([
            html.Div([
                html.H4("Pattern Analysis Results", style={"textAlign": "center", "marginBottom": "15px"}),
                html.Div(
                    id="pattern-overlay-container",
                    style={
                        "textAlign": "center",
                        "padding": "20px",
                        "backgroundColor": "#ffffff",
                        "borderRadius": "8px",
                        "minHeight": "400px"
                    },
                    children="Run analysis to see patterns"
                )
            ])
        ], style={"padding": "20px"})
    )


def create_statistics_tab():
    """
    Create statistics tab for displaying analysis metrics.

    Returns:
        dcc.Tab: Tab component for statistical visualizations
    """
    return dcc.Tab(
        label="Statistics",
        value="statistics-tab",
        children=html.Div([
            html.Div([
                html.H4("Analysis Statistics", style={"marginBottom": "15px"}),
                html.Div(
                    id="statistics-container",
                    style={
                        "display": "grid",
                        "gridTemplateColumns": "repeat(auto-fit, minmax(250px, 1fr))",
                        "gap": "20px",
                        "padding": "20px",
                        "backgroundColor": "#ffffff",
                        "borderRadius": "8px"
                    },
                    children="No statistics available"
                )
            ])
        ], style={"padding": "20px"})
    )


def create_frequency_tab():
    """
    Create frequency analysis tab for FFT and spectral analysis.

    Returns:
        dcc.Tab: Tab component for frequency domain visualization
    """
    return dcc.Tab(
        label="Frequency Analysis",
        value="frequency-tab",
        children=html.Div([
            html.Div([
                html.H4("Frequency Domain Analysis", style={"marginBottom": "15px"}),
                dcc.Graph(
                    id="frequency-graph",
                    style={
                        "backgroundColor": "#ffffff",
                        "borderRadius": "8px",
                        "padding": "10px"
                    },
                    figure=create_empty_frequency_figure()
                )
            ])
        ], style={"padding": "20px"})
    )


def create_empty_frequency_figure():
    """
    Create empty figure for frequency analysis.

    Returns:
        go.Figure: Empty Plotly figure
    """
    fig = go.Figure()
    fig.update_layout(
        title="Frequency Spectrum",
        xaxis_title="Frequency",
        yaxis_title="Magnitude",
        template="plotly_white",
        height=400
    )
    fig.add_annotation(
        text="Run Fourier analysis to see frequency spectrum",
        xref="paper", yref="paper",
        x=0.5, y=0.5,
        showarrow=False,
        font=dict(size=14, color="gray")
    )
    return fig


def create_stat_card(title: str, value: str, description: str = "", icon: str = "📊"):
    """
    Create a statistics card component.

    Args:
        title: Card title
        value: Main value to display
        description: Optional description
        icon: Optional icon/emoji

    Returns:
        html.Div: Statistics card component
    """
    return html.Div([
        html.Div([
            html.Span(icon, style={"fontSize": 32}),
            html.H4(title, style={"margin": "10px 0 5px 0", "color": "#6c757d"})
        ]),
        html.H2(value, style={"margin": "10px 0", "color": "#007bff"}),
        html.P(description, style={"color": "#6c757d", "fontSize": 14, "margin": 0})
    ], style={
        "padding": "20px",
        "backgroundColor": "#f8f9fa",
        "borderRadius": "8px",
        "border": "1px solid #dee2e6",
        "textAlign": "center"
    })


def create_edge_density_chart(edge_density: float):
    """
    Create a gauge chart for edge density visualization.

    Args:
        edge_density: Edge density value (0-1)

    Returns:
        go.Figure: Plotly gauge figure
    """
    fig = go.Figure(go.Indicator(
        mode="gauge+number",
        value=edge_density * 100,
        title={"text": "Edge Density (%)"},
        gauge={
            "axis": {"range": [0, 100]},
            "bar": {"color": "#007bff"},
            "steps": [
                {"range": [0, 33], "color": "#e3f2fd"},
                {"range": [33, 66], "color": "#90caf9"},
                {"range": [66, 100], "color": "#42a5f5"}
            ],
            "threshold": {
                "line": {"color": "red", "width": 4},
                "thickness": 0.75,
                "value": 90
            }
        }
    ))
    fig.update_layout(height=250, margin=dict(l=20, r=20, t=40, b=20))
    return fig


def create_histogram_figure(data, title: str = "Distribution"):
    """
    Create histogram figure for data distribution.

    Args:
        data: Array of data values
        title: Chart title

    Returns:
        go.Figure: Plotly histogram figure
    """
    fig = go.Figure(data=[go.Histogram(
        x=data,
        nbinsx=50,
        marker_color="#007bff",
        opacity=0.7
    )])
    fig.update_layout(
        title=title,
        xaxis_title="Value",
        yaxis_title="Count",
        template="plotly_white",
        height=300
    )
    return fig


def create_2d_scatter_figure(x_data, y_data, title: str = "Scatter Plot", color_column=None):
    """
    Create 2D scatter plot for clustering results.

    Args:
        x_data: X coordinate data
        y_data: Y coordinate data
        title: Chart title
        color_column: Optional color values for points

    Returns:
        go.Figure: Plotly scatter figure
    """
    fig = go.Figure(data=go.Scatter(
        x=x_data,
        y=y_data,
        mode="markers",
        marker=dict(
            size=5,
            color=color_column if color_column is not None else "#007bff",
            colorscale="Viridis" if color_column is not None else None,
            opacity=0.7,
            showscale=color_column is not None
        )
    ))
    fig.update_layout(
        title=title,
        xaxis_title="X",
        yaxis_title="Y",
        template="plotly_white",
        height=400
    )
    return fig


def create_heatmap_figure(data, title: str = "Heatmap"):
    """
    Create heatmap figure for 2D data visualization.

    Args:
        data: 2D array data
        title: Chart title

    Returns:
        go.Figure: Plotly heatmap figure
    """
    fig = go.Figure(data=go.Heatmap(
        z=data,
        colorscale="Viridis"
    ))
    fig.update_layout(
        title=title,
        template="plotly_white",
        height=400
    )
    return fig
