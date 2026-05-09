; DESCRIPTION: Creates a blue circular shape at (421, 122) with radius 31.
; PLAN: r0=421(x), r1=122(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 122
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
