; DESCRIPTION: Places a purple circle of radius 61 at center (393, 163).
; PLAN: r0=393(x), r1=163(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 163
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
