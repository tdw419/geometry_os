; DESCRIPTION: Creates a black circular shape at (279, 193) with radius 15.
; PLAN: r0=279(x), r1=193(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 193
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
