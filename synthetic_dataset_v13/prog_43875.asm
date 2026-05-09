; DESCRIPTION: Places a purple circle of radius 47 at center (244, 137).
; PLAN: r0=244(x), r1=137(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 137
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
