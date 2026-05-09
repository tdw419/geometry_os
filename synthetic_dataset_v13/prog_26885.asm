; DESCRIPTION: Places a purple circle of radius 25 at center (417, 107).
; PLAN: r0=417(x), r1=107(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 107
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
