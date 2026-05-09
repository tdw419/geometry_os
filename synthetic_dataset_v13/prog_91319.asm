; DESCRIPTION: Places a purple circle of radius 44 at center (240, 97).
; PLAN: r0=240(x), r1=97(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 97
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
