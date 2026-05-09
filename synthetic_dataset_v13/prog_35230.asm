; DESCRIPTION: Places a purple circle of radius 69 at center (339, 100).
; PLAN: r0=339(x), r1=100(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 100
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
