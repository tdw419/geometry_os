; DESCRIPTION: Places a purple circle of radius 26 at center (261, 26).
; PLAN: r0=261(x), r1=26(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 26
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
