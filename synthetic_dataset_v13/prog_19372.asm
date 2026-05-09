; DESCRIPTION: Draws a magenta rectangle at (404, 85) with width 21 and height 62.
; PLAN: r0=404(x), r1=85(y), r2=21(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 85
LDI r2, 21
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
