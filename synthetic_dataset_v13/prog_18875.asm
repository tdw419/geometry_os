; DESCRIPTION: Creates a black circular shape at (142, 177) with radius 40.
; PLAN: r0=142(x), r1=177(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 177
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
