; DESCRIPTION: Draws a blue circle centered at (77, 142) with radius 47.
; PLAN: r0=77(x), r1=142(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 142
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
