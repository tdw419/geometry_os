; DESCRIPTION: Creates a white circular shape at (227, 81) with radius 36.
; PLAN: r0=227(x), r1=81(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 81
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
