; DESCRIPTION: Draws a black circle centered at (78, 204) with radius 47.
; PLAN: r0=78(x), r1=204(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 204
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
