; DESCRIPTION: Places a cyan circle of radius 22 at center (359, 139).
; PLAN: r0=359(x), r1=139(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 139
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
