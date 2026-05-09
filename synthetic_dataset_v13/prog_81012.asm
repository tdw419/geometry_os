; DESCRIPTION: Creates a black circular shape at (366, 74) with radius 14.
; PLAN: r0=366(x), r1=74(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 74
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
