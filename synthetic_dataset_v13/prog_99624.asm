; DESCRIPTION: Places a green line segment connecting (129, 76) to (129, 139).
; PLAN: r0=129(x1), r1=76(y1), r2=129(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 76
LDI r2, 129
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
