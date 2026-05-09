; DESCRIPTION: Places a green circle of radius 78 at center (203, 139).
; PLAN: r0=203(x), r1=139(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 139
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
