; DESCRIPTION: Creates a blue circular shape at (122, 93) with radius 66.
; PLAN: r0=122(x), r1=93(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 93
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
