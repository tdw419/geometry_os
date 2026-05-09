; DESCRIPTION: Creates a white circular shape at (26, 61) with radius 17.
; PLAN: r0=26(x), r1=61(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 61
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
