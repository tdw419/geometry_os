; DESCRIPTION: Creates a white circular shape at (101, 115) with radius 47.
; PLAN: r0=101(x), r1=115(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 115
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
