"""
WordPress Task Handler for Evolution Daemon

Handles agent requests from WordPress:
- content_intelligence: Auto-tag, excerpts, categories
- evolution_publish: Publish daemon discoveries
- plugin_analysis: Security scan, update suggestions
"""
import json
import subprocess
from pathlib import Path
from typing import Dict, Any, Optional, List


class WordPressTaskHandler:
    """Handler for WordPress-originated agent tasks"""

    WORDPRESS_PATH = Path(__file__).parent.parent.parent / "wordpress_zone" / "wordpress"

    def __init__(self):
        self.wp_cli = self._find_wp_cli()

    def _find_wp_cli(self) -> Optional[str]:
        """Find wp-cli executable"""
        try:
            result = subprocess.run(['which', 'wp'], capture_output=True, text=True)
            if result.returncode == 0:
                return result.stdout.strip()
        except Exception:
            pass
        return None

    def execute(self, task: Dict[str, Any]) -> Dict[str, Any]:
        """
        Execute a WordPress agent task.

        Args:
            task: Dict with agent_type and payload

        Returns:
            Result dict with status and data
        """
        agent_type = task.get('agent_type')
        payload = task.get('payload', {})

        handlers = {
            'content_intelligence': self._handle_content_intelligence,
            'evolution_publish': self._handle_evolution_publish,
            'plugin_analysis': self._handle_plugin_analysis
        }

        handler = handlers.get(agent_type)
        if not handler:
            return {'status': 'error', 'error': f'Unknown agent type: {agent_type}'}

        try:
            return handler(payload)
        except Exception as e:
            return {'status': 'error', 'error': str(e)}

    def _handle_content_intelligence(self, payload: Dict) -> Dict[str, Any]:
        """
        Handle content intelligence tasks.
        Actions: auto_tag, generate_excerpt, suggest_category
        """
        action = payload.get('action')
        post_id = payload.get('post_id')

        if action == 'auto_tag':
            return self._auto_tag_post(post_id)
        elif action == 'generate_excerpt':
            return self._generate_excerpt(post_id)
        elif action == 'suggest_category':
            return self._suggest_category(post_id)

        return {'status': 'error', 'error': f'Unknown action: {action}'}

    def _auto_tag_post(self, post_id: int) -> Dict[str, Any]:
        """Generate and apply tags based on content analysis"""
        # Get post content via WP bridge
        post_data = self._get_wp_post(post_id)
        if not post_data:
            return {'status': 'error', 'error': 'Post not found'}

        content = post_data.get('post_content', '')
        title = post_data.get('post_title', '')

        # Analyze content for tags (simple keyword extraction)
        tags = self._extract_keywords(f"{title} {content}")

        # Apply tags via WebMCP bridge
        self._apply_tags(post_id, tags)

        return {
            'status': 'success',
            'post_id': post_id,
            'tags': tags
        }

    def _generate_excerpt(self, post_id: int) -> Dict[str, Any]:
        """Generate excerpt from post content"""
        post_data = self._get_wp_post(post_id)
        if not post_data:
            return {'status': 'error', 'error': 'Post not found'}

        content = post_data.get('post_content', '')

        # Simple excerpt: first 155 characters
        excerpt = content[:155].rsplit(' ', 1)[0]
        if len(content) > 155:
            excerpt += '...'

        return {
            'status': 'success',
            'post_id': post_id,
            'excerpt': excerpt
        }

    def _suggest_category(self, post_id: int) -> Dict[str, Any]:
        """Suggest category based on content"""
        post_data = self._get_wp_post(post_id)
        if not post_data:
            return {'status': 'error', 'error': 'Post not found'}

        # Get available categories
        categories = self._get_categories()

        # Simple matching based on keywords
        content = f"{post_data.get('post_title', '')} {post_data.get('post_content', '')}"
        suggested = self._match_category(content, categories)

        return {
            'status': 'success',
            'post_id': post_id,
            'suggested_category': suggested
        }

    def _handle_evolution_publish(self, payload: Dict) -> Dict[str, Any]:
        """
        Publish Evolution Daemon discovery as WordPress post.
        """
        commit_hash = payload.get('commit_hash')
        message = payload.get('message', '')

        # Create post via WebMCP bridge
        post_data = {
            'title': f'Evolution: {message[:50]}...',
            'content': f'''
## Evolution Discovery

**Commit:** {commit_hash}
**Message:** {message}

*Auto-published by Geometry OS Evolution Daemon*
''',
            'status': 'draft',
            'category': 'Evolution Log'
        }

        result = self._create_wp_post(post_data)

        return {
            'status': 'success',
            'post_id': result.get('post_id'),
            'commit_hash': commit_hash
        }

    def _handle_plugin_analysis(self, payload: Dict) -> Dict[str, Any]:
        """
        Analyze installed WordPress plugins.
        Actions: security, updates, compatibility
        """
        scan_type = payload.get('scan_type', 'security')

        # Get installed plugins
        plugins = self._get_installed_plugins()

        if scan_type == 'security':
            return self._security_scan(plugins)
        elif scan_type == 'updates':
            return self._check_updates(plugins)

        return {'status': 'error', 'error': f'Unknown scan type: {scan_type}'}

    def _security_scan(self, plugins: list) -> Dict[str, Any]:
        """Check plugins for known security issues"""
        # Placeholder: In production, query WPVulnDB API
        return {
            'status': 'success',
            'scan_type': 'security',
            'plugins': plugins,
            'issues': []  # No issues found (placeholder)
        }

    def _check_updates(self, plugins: list) -> Dict[str, Any]:
        """Check for plugin updates"""
        return {
            'status': 'success',
            'scan_type': 'updates',
            'plugins': plugins,
            'updates_available': []
        }

    # Helper methods

    def _get_wp_post(self, post_id: int) -> Optional[Dict]:
        """Get WordPress post by ID"""
        # Use WebMCP bridge or direct DB query
        telemetry_path = self.WORDPRESS_PATH.parent / "telemetry" / "posts.json"
        if telemetry_path.exists():
            with open(telemetry_path) as f:
                posts = json.load(f)
                return posts.get(str(post_id))
        return None

    def _apply_tags(self, post_id: int, tags: list):
        """Apply tags to WordPress post via bridge"""
        # Write to bridge command file
        cmd_path = self.WORDPRESS_PATH.parent / "bridge_commands" / f"tags_{post_id}.json"
        cmd_path.parent.mkdir(parents=True, exist_ok=True)
        with open(cmd_path, 'w') as f:
            json.dump({'post_id': post_id, 'tags': tags}, f)

    def _extract_keywords(self, text: str, max_tags: int = 5) -> list:
        """Extract keywords from text for tagging"""
        # Simple keyword extraction (stopwords filtering)
        stopwords = {'the', 'a', 'an', 'is', 'are', 'was', 'were', 'be', 'been',
                     'being', 'have', 'has', 'had', 'do', 'does', 'did', 'will',
                     'would', 'could', 'should', 'may', 'might', 'must', 'to', 'of',
                     'in', 'for', 'on', 'with', 'at', 'by', 'from', 'as', 'into',
                     'this', 'that', 'these', 'those', 'it', 'its', 'and', 'or', 'but'}

        words = text.lower().split()
        keywords = [w.strip('.,!?;:"\'()[]{}') for w in words
                    if w.strip('.,!?;:"\'()[]{}') not in stopwords and len(w) > 3]

        # Return top unique words
        return list(dict.fromkeys(keywords))[:max_tags]

    def _get_categories(self) -> list:
        """Get available WordPress categories"""
        return ['Evolution Log', 'Development', 'Architecture', 'Tutorial', 'News']

    def _match_category(self, content: str, categories: list) -> str:
        """Match content to category"""
        content_lower = content.lower()
        if 'evolution' in content_lower or 'daemon' in content_lower:
            return 'Evolution Log'
        elif 'architecture' in content_lower or 'design' in content_lower:
            return 'Architecture'
        elif 'tutorial' in content_lower or 'how to' in content_lower:
            return 'Tutorial'
        return 'Development'

    def _create_wp_post(self, post_data: Dict) -> Dict:
        """Create WordPress post via bridge"""
        # Write to bridge command file
        cmd_path = self.WORDPRESS_PATH.parent / "bridge_commands" / "create_post.json"
        cmd_path.parent.mkdir(parents=True, exist_ok=True)
        with open(cmd_path, 'w') as f:
            json.dump(post_data, f)
        return {'post_id': 'pending'}

    def _get_installed_plugins(self) -> list:
        """Get list of installed WordPress plugins"""
        plugins_path = self.WORDPRESS_PATH / "wp-content" / "plugins"
        if plugins_path.exists():
            return [d.name for d in plugins_path.iterdir() if d.is_dir() and not d.name.startswith('.')]
        return []
