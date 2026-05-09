; DESCRIPTION: Draws a blue circle centered at (50, 156) with radius 20.
; PLAN: r0=50(x), r1=156(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 156
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
