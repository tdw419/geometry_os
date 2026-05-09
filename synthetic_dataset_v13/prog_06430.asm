; DESCRIPTION: Places a purple circle of radius 43 at center (210, 45).
; PLAN: r0=210(x), r1=45(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 45
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
