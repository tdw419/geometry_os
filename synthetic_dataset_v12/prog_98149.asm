; DESCRIPTION: Draws a magenta rectangle at (357, 43) with width 84 and height 36.
; PLAN: r0=357(x), r1=43(y), r2=84(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 43
LDI r2, 84
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
