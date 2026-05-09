; DESCRIPTION: Creates a black circular shape at (347, 106) with radius 32.
; PLAN: r0=347(x), r1=106(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 106
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
