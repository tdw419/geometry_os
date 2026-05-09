; DESCRIPTION: Places a red circle of radius 67 at center (388, 139).
; PLAN: r0=388(x), r1=139(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 139
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
