; DESCRIPTION: Creates a yellow circular shape at (379, 79) with radius 79.
; PLAN: r0=379(x), r1=79(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 79
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
