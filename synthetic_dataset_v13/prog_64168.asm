; DESCRIPTION: Places a purple circle of radius 14 at center (390, 132).
; PLAN: r0=390(x), r1=132(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 132
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
