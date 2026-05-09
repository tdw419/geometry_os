; DESCRIPTION: Draws a blue circle centered at (361, 169) with radius 53.
; PLAN: r0=361(x), r1=169(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 169
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
