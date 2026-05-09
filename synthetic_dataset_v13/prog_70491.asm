; DESCRIPTION: Draws a magenta rectangle at (132, 63) with width 106 and height 107.
; PLAN: r0=132(x), r1=63(y), r2=106(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 63
LDI r2, 106
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
