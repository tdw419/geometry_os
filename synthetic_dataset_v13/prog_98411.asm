; DESCRIPTION: Creates a black circular shape at (159, 145) with radius 67.
; PLAN: r0=159(x), r1=145(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 145
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
