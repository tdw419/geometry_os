; DESCRIPTION: Creates a black circular shape at (451, 130) with radius 22.
; PLAN: r0=451(x), r1=130(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 130
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
