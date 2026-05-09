; DESCRIPTION: Draws a magenta rectangle at (20, 156) with width 95 and height 30.
; PLAN: r0=20(x), r1=156(y), r2=95(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 156
LDI r2, 95
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
