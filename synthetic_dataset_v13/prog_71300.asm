; DESCRIPTION: Places a purple circle of radius 10 at center (347, 60).
; PLAN: r0=347(x), r1=60(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 60
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
