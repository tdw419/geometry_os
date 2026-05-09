; DESCRIPTION: Places a purple circle of radius 51 at center (355, 67).
; PLAN: r0=355(x), r1=67(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 67
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
