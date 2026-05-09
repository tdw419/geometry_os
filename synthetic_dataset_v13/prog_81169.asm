; DESCRIPTION: Places a purple circle of radius 70 at center (337, 89).
; PLAN: r0=337(x), r1=89(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 89
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
