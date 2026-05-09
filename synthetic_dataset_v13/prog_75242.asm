; DESCRIPTION: Creates a blue circular shape at (134, 106) with radius 71.
; PLAN: r0=134(x), r1=106(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 106
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
