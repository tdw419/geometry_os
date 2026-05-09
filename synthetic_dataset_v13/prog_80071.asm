; DESCRIPTION: Creates a black circular shape at (339, 134) with radius 74.
; PLAN: r0=339(x), r1=134(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 134
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
