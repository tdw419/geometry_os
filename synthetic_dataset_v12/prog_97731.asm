; DESCRIPTION: Creates a yellow circular shape at (51, 139) with radius 37.
; PLAN: r0=51(x), r1=139(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 139
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
