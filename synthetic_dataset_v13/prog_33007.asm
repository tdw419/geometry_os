; DESCRIPTION: Creates a yellow circular shape at (379, 232) with radius 19.
; PLAN: r0=379(x), r1=232(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 232
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
