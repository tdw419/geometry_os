; DESCRIPTION: Places a purple circle of radius 17 at center (456, 176).
; PLAN: r0=456(x), r1=176(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 176
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
