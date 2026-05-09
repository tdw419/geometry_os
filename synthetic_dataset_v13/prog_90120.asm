; DESCRIPTION: Draws a magenta rectangle at (324, 6) with width 62 and height 106.
; PLAN: r0=324(x), r1=6(y), r2=62(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 6
LDI r2, 62
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
