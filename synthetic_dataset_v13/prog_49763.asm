; DESCRIPTION: Draws a magenta rectangle at (29, 91) with width 106 and height 52.
; PLAN: r0=29(x), r1=91(y), r2=106(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 91
LDI r2, 106
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
