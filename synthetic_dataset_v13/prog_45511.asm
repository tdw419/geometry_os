; DESCRIPTION: Draws a blue circle centered at (133, 227) with radius 19.
; PLAN: r0=133(x), r1=227(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 227
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
