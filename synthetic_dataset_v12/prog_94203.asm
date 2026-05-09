; DESCRIPTION: Creates a white circular shape at (96, 49) with radius 13.
; PLAN: r0=96(x), r1=49(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 49
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
