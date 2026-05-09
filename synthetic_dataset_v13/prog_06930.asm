; DESCRIPTION: Creates a blue circular shape at (286, 155) with radius 70.
; PLAN: r0=286(x), r1=155(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 155
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
