; DESCRIPTION: Creates a blue circular shape at (140, 76) with radius 75.
; PLAN: r0=140(x), r1=76(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 76
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
