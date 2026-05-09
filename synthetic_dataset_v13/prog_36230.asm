; DESCRIPTION: Creates a red circular shape at (194, 123) with radius 73.
; PLAN: r0=194(x), r1=123(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 123
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
