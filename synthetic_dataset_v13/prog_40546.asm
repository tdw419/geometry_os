; DESCRIPTION: Places a purple circle of radius 69 at center (437, 115).
; PLAN: r0=437(x), r1=115(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 115
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
