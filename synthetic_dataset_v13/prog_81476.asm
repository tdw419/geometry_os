; DESCRIPTION: Creates a black circular shape at (39, 105) with radius 25.
; PLAN: r0=39(x), r1=105(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 105
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
