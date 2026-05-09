; DESCRIPTION: Places a purple circle of radius 75 at center (102, 101).
; PLAN: r0=102(x), r1=101(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 101
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
