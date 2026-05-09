; DESCRIPTION: Places a purple circle of radius 10 at center (31, 94).
; PLAN: r0=31(x), r1=94(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 94
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
