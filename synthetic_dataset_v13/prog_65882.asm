; DESCRIPTION: Places a purple circle of radius 57 at center (162, 101).
; PLAN: r0=162(x), r1=101(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 101
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
