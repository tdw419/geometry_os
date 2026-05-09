; DESCRIPTION: Creates a white circular shape at (14, 16) with radius 11.
; PLAN: r0=14(x), r1=16(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 16
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
