; DESCRIPTION: Places a purple circle of radius 15 at center (87, 23).
; PLAN: r0=87(x), r1=23(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 23
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
