; DESCRIPTION: Creates a white circular shape at (452, 158) with radius 11.
; PLAN: r0=452(x), r1=158(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 158
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
