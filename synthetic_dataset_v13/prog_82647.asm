; DESCRIPTION: Creates a white circular shape at (77, 158) with radius 76.
; PLAN: r0=77(x), r1=158(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 158
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
