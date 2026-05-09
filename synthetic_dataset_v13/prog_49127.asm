; DESCRIPTION: Places a purple circle of radius 58 at center (98, 67).
; PLAN: r0=98(x), r1=67(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 67
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
