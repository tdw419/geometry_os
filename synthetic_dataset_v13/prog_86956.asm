; DESCRIPTION: Draws a black circle centered at (158, 219) with radius 13.
; PLAN: r0=158(x), r1=219(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 219
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
