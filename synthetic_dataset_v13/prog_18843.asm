; DESCRIPTION: Places a purple circle of radius 28 at center (213, 139).
; PLAN: r0=213(x), r1=139(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 139
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
