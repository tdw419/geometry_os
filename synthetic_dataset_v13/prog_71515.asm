; DESCRIPTION: Creates a white circular shape at (287, 87) with radius 43.
; PLAN: r0=287(x), r1=87(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 87
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
