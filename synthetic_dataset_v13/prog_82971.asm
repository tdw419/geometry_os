; DESCRIPTION: Places a purple circle of radius 22 at center (44, 225).
; PLAN: r0=44(x), r1=225(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 225
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
