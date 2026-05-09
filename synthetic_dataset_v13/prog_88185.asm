; DESCRIPTION: Creates a blue circular shape at (347, 163) with radius 79.
; PLAN: r0=347(x), r1=163(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 163
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
