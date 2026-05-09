; DESCRIPTION: Draws a black circle centered at (312, 33) with radius 23.
; PLAN: r0=312(x), r1=33(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 33
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
