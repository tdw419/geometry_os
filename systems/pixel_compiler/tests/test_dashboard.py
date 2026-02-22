"""
Tests for the PixelRTS Dashboard application.
"""

import pytest
import sys
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock

# Add dashboard to path
sys.path.insert(0, str(Path(__file__).parent.parent / "dashboard"))


class TestDashboardApp:
    """Test dashboard app initialization and configuration."""

    def test_create_dashboard_app_default_config(self):
        """Test dashboard creation with default configuration."""
        from unittest.mock import patch
        from dashboard.app import create_dashboard_app

        with patch("dashboard.app.Dash") as mock_dash_class:
            mock_app_instance = MagicMock()
            mock_dash_class.return_value = mock_app_instance

            app = create_dashboard_app("PixelRTS Dashboard", port=8050)

            # Verify Dash was called
            mock_dash_class.assert_called_once()
            assert app is not None

    def test_create_dashboard_app_custom_port(self):
        """Test dashboard creation with custom port."""
        from unittest.mock import patch
        from dashboard.app import create_dashboard_app

        with patch("dashboard.app.Dash") as mock_dash_class:
            mock_app_instance = MagicMock()
            mock_dash_class.return_value = mock_app_instance

            app = create_dashboard_app("Test Dashboard", port=9090)

            assert app is not None

    def test_create_dashboard_app_registers_callbacks(self):
        """Test that callbacks are registered during app creation."""
        from unittest.mock import patch, call
        from dashboard.app import create_dashboard_app

        with patch("dashboard.app.Dash") as mock_dash_class:
            mock_app_instance = MagicMock()
            mock_dash_class.return_value = mock_app_instance

            with patch("dashboard.app._register_callbacks") as mock_register:
                app = create_dashboard_app("PixelRTS Dashboard")

                mock_register.assert_called_once_with(mock_app_instance)

    def test_app_has_layout(self):
        """Test that app has a layout assigned."""
        from unittest.mock import patch
        from dashboard.app import create_dashboard_app

        with patch("dashboard.app.Dash") as mock_dash_class:
            mock_app_instance = MagicMock()
            mock_dash_class.return_value = mock_app_instance

            create_dashboard_app("PixelRTS Dashboard")

            assert mock_app_instance.layout is not None


class TestDashboardLayout:
    """Test dashboard layout components."""

    def test_create_layout_returns_div(self):
        """Test that create_layout returns a Dash component."""
        from dashboard.layout import create_layout

        layout = create_layout()

        assert layout is not None
        assert layout._type == "Div"

    def test_layout_has_upload_component(self):
        """Test that layout includes file upload component."""
        from dashboard.layout import create_layout

        layout = create_layout()

        # Check for Upload component in layout tree
        layout_str = str(layout)
        assert "Upload" in layout_str or "upload" in layout_str.lower()

    def test_layout_has_tabs(self):
        """Test that layout includes tabbed interface."""
        from dashboard.layout import create_layout

        layout = create_layout()

        layout_str = str(layout)
        assert "Tabs" in layout_str or "tabs" in layout_str.lower()

    def test_layout_has_analysis_checkboxes(self):
        """Test that layout includes analysis method checkboxes."""
        from dashboard.layout import create_layout

        layout = create_layout()

        layout_str = str(layout)
        # Check for analysis methods
        assert "edges" in layout_str.lower()
        assert "fourier" in layout_str.lower()

    def test_layout_has_edge_method_dropdown(self):
        """Test that layout includes edge detection method dropdown."""
        from dashboard.layout import create_layout

        layout = create_layout()

        layout_str = str(layout)
        assert "sobel" in layout_str.lower()
        assert "canny" in layout_str.lower()

    def test_layout_has_graph_components(self):
        """Test that layout includes Plotly graph components."""
        from dashboard.layout import create_layout

        layout = create_layout()

        layout_str = str(layout)
        assert "Graph" in layout_str


class TestDashboardComponents:
    """Test individual dashboard components."""

    def test_create_upload_component(self):
        """Test upload component creation."""
        from dashboard.components import create_upload_component

        upload = create_upload_component()

        assert upload is not None
        assert upload.id == "upload-data"

    def test_create_analysis_controls(self):
        """Test analysis controls component creation."""
        from dashboard.components import create_analysis_controls

        controls = create_analysis_controls()

        assert controls is not None

    def test_create_tabs(self):
        """Test tabs component creation."""
        from dashboard.components import create_tabs

        tabs = create_tabs()

        assert tabs is not None
        assert tabs.id == "main-tabs"

    def test_create_image_tab(self):
        """Test image view tab creation."""
        from dashboard.components import create_image_tab

        tab = create_image_tab()

        assert tab is not None
        assert "image" in str(tab.value).lower()

    def test_create_pattern_tab(self):
        """Test pattern overlay tab creation."""
        from dashboard.components import create_pattern_tab

        tab = create_pattern_tab()

        assert tab is not None
        assert "pattern" in str(tab.value).lower()

    def test_create_statistics_tab(self):
        """Test statistics tab creation."""
        from dashboard.components import create_statistics_tab

        tab = create_statistics_tab()

        assert tab is not None
        assert "statistics" in str(tab.value).lower()

    def test_create_frequency_tab(self):
        """Test frequency analysis tab creation."""
        from dashboard.components import create_frequency_tab

        tab = create_frequency_tab()

        assert tab is not None
        assert "frequency" in str(tab.value).lower()


class TestDashboardCallbacks:
    """Test dashboard callback registration."""

    def test_register_callbacks_adds_upload_callback(self):
        """Test that upload callback is registered."""
        from dashboard.app import _register_callbacks

        mock_app = MagicMock()
        mock_app.callback = MagicMock()

        _register_callbacks(mock_app)

        # Verify callback was called
        assert mock_app.callback.call_count > 0

    def test_register_callbacks_adds_analysis_callbacks(self):
        """Test that analysis callbacks are registered."""
        from dashboard.app import _register_callbacks

        mock_app = MagicMock()
        mock_app.callback = MagicMock()

        _register_callbacks(mock_app)

        # Should have multiple callbacks registered
        assert mock_app.callback.call_count >= 2


class TestDashboardAnalysis:
    """Test dashboard analysis functionality."""

    def test_parse_uploaded_file(self):
        """Test parsing uploaded file content."""
        from dashboard.app import parse_uploaded_file

        # Mock file content
        mock_content = b"fake image data"
        mock_filename = "test.rts.png"

        # Should handle gracefully
        result = parse_uploaded_file(mock_content, mock_filename)
        # Result handling depends on implementation

    def test_perform_edge_analysis(self):
        """Test edge analysis from uploaded image."""
        from dashboard.app import perform_edge_analysis

        # This test depends on PatternDetector integration
        # Placeholder for future implementation
        pass


@pytest.fixture
def sample_image_path(tmp_path):
    """Create a sample test image."""
    import numpy as np
    from PIL import Image

    # Create a simple test pattern
    img_array = np.random.randint(0, 255, (100, 100, 3), dtype=np.uint8)
    img_path = tmp_path / "test_pattern.png"

    img = Image.fromarray(img_array)
    img.save(img_path)

    return str(img_path)


class TestDashboardIntegration:
    """Integration tests for dashboard components."""

    def test_full_app_initialization(self):
        """Test complete app initialization without running server."""
        from unittest.mock import patch
        from dashboard.app import create_dashboard_app

        with patch("dashboard.app.Dash"):
            app = create_dashboard_app("Test Dashboard")
            assert app is not None

    def test_layout_structure_complete(self):
        """Test that layout has all required sections."""
        from dashboard.layout import create_layout

        layout = create_layout()
        layout_str = str(layout).lower()

        # Check for all major components
        required_components = [
            "upload", "tabs", "image", "pattern", "statistics", "frequency"
        ]

        for component in required_components:
            assert component in layout_str, f"Missing component: {component}"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
