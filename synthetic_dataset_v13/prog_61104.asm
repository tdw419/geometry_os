; DESCRIPTION: Places a purple circle of radius 31 at center (266, 148).
; PLAN: r0=266(x), r1=148(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 148
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
