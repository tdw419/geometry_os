; DESCRIPTION: Draws a magenta rectangle at (357, 97) with width 22 and height 17.
; PLAN: r0=357(x), r1=97(y), r2=22(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 97
LDI r2, 22
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
