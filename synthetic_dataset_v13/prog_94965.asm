; DESCRIPTION: Places a purple circle of radius 76 at center (90, 122).
; PLAN: r0=90(x), r1=122(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 122
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
