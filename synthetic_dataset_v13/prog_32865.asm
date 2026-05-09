; DESCRIPTION: Places a orange circle of radius 67 at center (244, 139).
; PLAN: r0=244(x), r1=139(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 139
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
