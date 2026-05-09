; DESCRIPTION: Places a black circle of radius 39 at center (216, 139).
; PLAN: r0=216(x), r1=139(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 139
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
