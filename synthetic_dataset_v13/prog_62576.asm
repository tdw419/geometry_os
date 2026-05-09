; DESCRIPTION: Creates a blue circular shape at (347, 164) with radius 56.
; PLAN: r0=347(x), r1=164(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 164
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
