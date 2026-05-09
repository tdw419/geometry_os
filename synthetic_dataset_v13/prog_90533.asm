; DESCRIPTION: Places a purple circle of radius 25 at center (256, 191).
; PLAN: r0=256(x), r1=191(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 191
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
