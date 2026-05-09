; DESCRIPTION: Places a purple circle of radius 44 at center (163, 54).
; PLAN: r0=163(x), r1=54(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 54
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
