; DESCRIPTION: Creates a white circular shape at (153, 76) with radius 66.
; PLAN: r0=153(x), r1=76(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 76
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
