; DESCRIPTION: Creates a yellow circular shape at (189, 79) with radius 73.
; PLAN: r0=189(x), r1=79(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 79
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
