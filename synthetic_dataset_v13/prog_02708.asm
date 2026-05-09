; DESCRIPTION: Places a purple circle of radius 29 at center (436, 53).
; PLAN: r0=436(x), r1=53(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 53
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
