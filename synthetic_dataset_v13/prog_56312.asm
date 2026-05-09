; DESCRIPTION: Creates a white circular shape at (161, 157) with radius 14.
; PLAN: r0=161(x), r1=157(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 157
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
