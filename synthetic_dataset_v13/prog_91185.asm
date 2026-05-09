; DESCRIPTION: Creates a white circular shape at (318, 101) with radius 66.
; PLAN: r0=318(x), r1=101(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 101
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
