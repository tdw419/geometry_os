; DESCRIPTION: Creates a blue circular shape at (166, 155) with radius 79.
; PLAN: r0=166(x), r1=155(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 155
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
