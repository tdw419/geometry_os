; DESCRIPTION: Draws a black circle centered at (78, 60) with radius 23.
; PLAN: r0=78(x), r1=60(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 60
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
