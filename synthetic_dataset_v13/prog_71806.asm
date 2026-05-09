; DESCRIPTION: Places a green circle of radius 18 at center (188, 139).
; PLAN: r0=188(x), r1=139(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 139
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
