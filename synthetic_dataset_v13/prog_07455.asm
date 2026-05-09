; DESCRIPTION: Places a yellow line segment connecting (40, 106) to (13, 238).
; PLAN: r0=40(x1), r1=106(y1), r2=13(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 106
LDI r2, 13
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
