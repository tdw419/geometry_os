; DESCRIPTION: Creates a black circular shape at (252, 157) with radius 14.
; PLAN: r0=252(x), r1=157(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 157
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
