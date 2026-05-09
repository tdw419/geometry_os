; DESCRIPTION: Places a purple circle of radius 80 at center (315, 84).
; PLAN: r0=315(x), r1=84(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 84
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
