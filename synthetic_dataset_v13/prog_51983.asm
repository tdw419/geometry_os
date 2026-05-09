; DESCRIPTION: Places a purple circle of radius 49 at center (167, 159).
; PLAN: r0=167(x), r1=159(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 159
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
