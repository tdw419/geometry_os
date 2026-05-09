; DESCRIPTION: Places a purple circle of radius 46 at center (76, 57).
; PLAN: r0=76(x), r1=57(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 57
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
