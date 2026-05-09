; DESCRIPTION: Places a purple circle of radius 59 at center (311, 139).
; PLAN: r0=311(x), r1=139(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 139
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
