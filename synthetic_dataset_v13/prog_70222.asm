; DESCRIPTION: Places a purple circle of radius 47 at center (319, 58).
; PLAN: r0=319(x), r1=58(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 58
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
