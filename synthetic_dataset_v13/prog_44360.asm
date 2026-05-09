; DESCRIPTION: Creates a yellow circular shape at (194, 61) with radius 55.
; PLAN: r0=194(x), r1=61(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 61
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
