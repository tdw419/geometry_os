; DESCRIPTION: Places a purple circle of radius 34 at center (69, 110).
; PLAN: r0=69(x), r1=110(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 110
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
