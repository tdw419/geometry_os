; DESCRIPTION: Creates a blue circular shape at (334, 90) with radius 33.
; PLAN: r0=334(x), r1=90(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 90
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
