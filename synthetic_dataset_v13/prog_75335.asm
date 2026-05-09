; DESCRIPTION: Creates a black circular shape at (279, 119) with radius 22.
; PLAN: r0=279(x), r1=119(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 119
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
