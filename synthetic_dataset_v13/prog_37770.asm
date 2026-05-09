; DESCRIPTION: Creates a white circular shape at (312, 53) with radius 52.
; PLAN: r0=312(x), r1=53(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 53
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
