; DESCRIPTION: Places a purple circle of radius 15 at center (366, 183).
; PLAN: r0=366(x), r1=183(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 183
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
