; DESCRIPTION: Draws a magenta rectangle at (55, 154) with width 85 and height 93.
; PLAN: r0=55(x), r1=154(y), r2=85(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 154
LDI r2, 85
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
