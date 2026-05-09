; DESCRIPTION: Places a purple circle of radius 48 at center (319, 191).
; PLAN: r0=319(x), r1=191(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 191
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
