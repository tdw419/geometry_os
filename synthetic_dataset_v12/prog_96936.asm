; DESCRIPTION: Places a purple circle of radius 25 at center (364, 230).
; PLAN: r0=364(x), r1=230(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 230
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
