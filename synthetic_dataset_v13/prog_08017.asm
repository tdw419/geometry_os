; DESCRIPTION: Places a purple circle of radius 24 at center (176, 139).
; PLAN: r0=176(x), r1=139(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 139
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
