; DESCRIPTION: Places a purple circle of radius 21 at center (471, 49).
; PLAN: r0=471(x), r1=49(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 49
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
