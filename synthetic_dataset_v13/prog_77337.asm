; DESCRIPTION: Creates a white circular shape at (194, 136) with radius 69.
; PLAN: r0=194(x), r1=136(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 136
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
