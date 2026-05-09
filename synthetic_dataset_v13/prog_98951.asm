; DESCRIPTION: Creates a black circular shape at (265, 217) with radius 25.
; PLAN: r0=265(x), r1=217(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 217
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
