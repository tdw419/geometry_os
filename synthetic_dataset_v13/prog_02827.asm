; DESCRIPTION: Places a green line segment connecting (35, 78) to (22, 139).
; PLAN: r0=35(x1), r1=78(y1), r2=22(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 78
LDI r2, 22
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
