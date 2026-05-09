; DESCRIPTION: Creates a black circular shape at (84, 217) with radius 15.
; PLAN: r0=84(x), r1=217(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 217
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
