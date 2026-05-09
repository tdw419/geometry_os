; DESCRIPTION: Draws a magenta rectangle at (94, 100) with width 30 and height 106.
; PLAN: r0=94(x), r1=100(y), r2=30(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 100
LDI r2, 30
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
