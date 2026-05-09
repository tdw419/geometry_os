; DESCRIPTION: Draws a blue circle centered at (413, 119) with radius 18.
; PLAN: r0=413(x), r1=119(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 119
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
