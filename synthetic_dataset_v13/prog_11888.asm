; DESCRIPTION: Creates a blue circular shape at (159, 167) with radius 15.
; PLAN: r0=159(x), r1=167(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 167
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
