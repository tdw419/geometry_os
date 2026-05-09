; DESCRIPTION: Creates a black circular shape at (279, 78) with radius 37.
; PLAN: r0=279(x), r1=78(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 78
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
