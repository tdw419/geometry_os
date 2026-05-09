; DESCRIPTION: Places a purple circle of radius 34 at center (195, 158).
; PLAN: r0=195(x), r1=158(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 158
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
