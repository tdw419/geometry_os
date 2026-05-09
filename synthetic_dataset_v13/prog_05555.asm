; DESCRIPTION: Creates a blue circular shape at (334, 60) with radius 53.
; PLAN: r0=334(x), r1=60(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 60
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
