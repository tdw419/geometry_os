; DESCRIPTION: Places a purple circle of radius 35 at center (313, 101).
; PLAN: r0=313(x), r1=101(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 101
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
