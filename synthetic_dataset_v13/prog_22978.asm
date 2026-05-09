; DESCRIPTION: Creates a white circular shape at (388, 81) with radius 26.
; PLAN: r0=388(x), r1=81(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 81
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
