"""
PixelRTS Dashboard - Interactive Pattern Analysis Web Interface

A Dash/Plotly-based web dashboard for analyzing PixelRTS container images.
Provides real-time visualization of pattern detection results including:
- Edge detection (Sobel, Canny)
- Fourier transform analysis
- Statistical analysis
- Image pattern overlays
"""

from dashboard.app import (
    create_dashboard_app,
    run_dashboard,
    parse_uploaded_file,
    perform_edge_analysis
)

from dashboard.components import (
    create_upload_component,
    create_analysis_controls,
    create_tabs,
    create_image_tab,
    create_pattern_tab,
    create_statistics_tab,
    create_frequency_tab,
    create_stat_card,
    create_edge_density_chart,
    create_histogram_figure,
    create_2d_scatter_figure,
    create_heatmap_figure
)

from dashboard.layout import (
    create_layout,
    create_error_alert,
    create_success_alert,
    create_info_alert
)

__all__ = [
    # Main app
    "create_dashboard_app",
    "run_dashboard",
    "parse_uploaded_file",
    "perform_edge_analysis",

    # Components
    "create_upload_component",
    "create_analysis_controls",
    "create_tabs",
    "create_image_tab",
    "create_pattern_tab",
    "create_statistics_tab",
    "create_frequency_tab",
    "create_stat_card",
    "create_edge_density_chart",
    "create_histogram_figure",
    "create_2d_scatter_figure",
    "create_heatmap_figure",

    # Layout
    "create_layout",
    "create_error_alert",
    "create_success_alert",
    "create_info_alert"
]

__version__ = "0.1.0"
