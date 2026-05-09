; DESCRIPTION: Draws a blue circle centered at (268, 156) with radius 36.
; PLAN: r0=268(x), r1=156(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 156
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
