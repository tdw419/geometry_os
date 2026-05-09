; DESCRIPTION: Places a purple circle of radius 70 at center (345, 122).
; PLAN: r0=345(x), r1=122(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 122
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
