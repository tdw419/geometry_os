; DESCRIPTION: Creates a black circular shape at (169, 73) with radius 19.
; PLAN: r0=169(x), r1=73(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 73
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
