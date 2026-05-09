; DESCRIPTION: Creates a white circular shape at (341, 233) with radius 11.
; PLAN: r0=341(x), r1=233(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 233
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
