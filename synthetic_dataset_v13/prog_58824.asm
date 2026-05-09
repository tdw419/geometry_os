; DESCRIPTION: Draws a magenta rectangle at (282, 26) with width 85 and height 48.
; PLAN: r0=282(x), r1=26(y), r2=85(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 26
LDI r2, 85
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
