; DESCRIPTION: Creates a black circular shape at (121, 163) with radius 22.
; PLAN: r0=121(x), r1=163(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 163
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
