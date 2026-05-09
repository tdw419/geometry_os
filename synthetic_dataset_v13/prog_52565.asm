; DESCRIPTION: Places a purple circle of radius 35 at center (428, 39).
; PLAN: r0=428(x), r1=39(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 39
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
