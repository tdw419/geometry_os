; DESCRIPTION: Places a purple circle of radius 72 at center (347, 149).
; PLAN: r0=347(x), r1=149(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 149
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
