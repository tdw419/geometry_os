; DESCRIPTION: Draws a magenta rectangle at (223, 150) with width 106 and height 73.
; PLAN: r0=223(x), r1=150(y), r2=106(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 150
LDI r2, 106
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
