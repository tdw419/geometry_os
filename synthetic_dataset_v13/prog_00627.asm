; DESCRIPTION: Creates a yellow circular shape at (355, 137) with radius 51.
; PLAN: r0=355(x), r1=137(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 137
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
