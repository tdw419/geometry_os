; DESCRIPTION: Draws a black circle centered at (451, 217) with radius 18.
; PLAN: r0=451(x), r1=217(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 217
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
