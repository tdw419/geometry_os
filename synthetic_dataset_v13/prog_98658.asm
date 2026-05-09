; DESCRIPTION: Places a purple circle of radius 23 at center (181, 60).
; PLAN: r0=181(x), r1=60(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 60
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
