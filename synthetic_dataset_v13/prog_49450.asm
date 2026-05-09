; DESCRIPTION: Creates a white circular shape at (341, 62) with radius 16.
; PLAN: r0=341(x), r1=62(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 62
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
