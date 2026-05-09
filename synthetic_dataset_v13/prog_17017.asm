; DESCRIPTION: Places a purple circle of radius 25 at center (230, 83).
; PLAN: r0=230(x), r1=83(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 83
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
