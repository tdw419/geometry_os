; DESCRIPTION: Places a purple circle of radius 73 at center (158, 165).
; PLAN: r0=158(x), r1=165(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 165
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
