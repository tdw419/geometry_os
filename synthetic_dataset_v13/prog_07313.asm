; DESCRIPTION: Creates a blue circular shape at (426, 119) with radius 73.
; PLAN: r0=426(x), r1=119(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 119
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
