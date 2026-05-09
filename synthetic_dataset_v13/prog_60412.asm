; DESCRIPTION: Places a purple circle of radius 59 at center (258, 131).
; PLAN: r0=258(x), r1=131(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 131
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
