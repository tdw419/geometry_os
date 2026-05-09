; DESCRIPTION: Draws a magenta rectangle at (318, 77) with width 111 and height 106.
; PLAN: r0=318(x), r1=77(y), r2=111(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 77
LDI r2, 111
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
