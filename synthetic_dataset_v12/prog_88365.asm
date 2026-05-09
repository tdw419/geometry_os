; DESCRIPTION: Creates a yellow circular shape at (361, 105) with radius 61.
; PLAN: r0=361(x), r1=105(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 105
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
