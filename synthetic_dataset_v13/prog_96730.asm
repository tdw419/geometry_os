; DESCRIPTION: Places a purple circle of radius 18 at center (195, 181).
; PLAN: r0=195(x), r1=181(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 181
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
