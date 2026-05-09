; DESCRIPTION: Creates a white circular shape at (114, 184) with radius 70.
; PLAN: r0=114(x), r1=184(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 184
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
