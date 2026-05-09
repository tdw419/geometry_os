; DESCRIPTION: Places a purple circle of radius 40 at center (308, 53).
; PLAN: r0=308(x), r1=53(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 53
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
