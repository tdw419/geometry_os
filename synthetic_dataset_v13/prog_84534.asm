; DESCRIPTION: Creates a black circular shape at (102, 136) with radius 46.
; PLAN: r0=102(x), r1=136(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 136
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
