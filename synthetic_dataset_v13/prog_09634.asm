; DESCRIPTION: Places a purple circle of radius 39 at center (160, 188).
; PLAN: r0=160(x), r1=188(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 188
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
