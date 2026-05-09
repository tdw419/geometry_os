; DESCRIPTION: Draws a magenta rectangle at (351, 73) with width 106 and height 96.
; PLAN: r0=351(x), r1=73(y), r2=106(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 73
LDI r2, 106
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
