; DESCRIPTION: Places a orange circle of radius 29 at center (67, 139).
; PLAN: r0=67(x), r1=139(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 139
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
