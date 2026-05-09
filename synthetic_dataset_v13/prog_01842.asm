; DESCRIPTION: Places a green line segment connecting (190, 80) to (390, 11).
; PLAN: r0=190(x1), r1=80(y1), r2=390(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 80
LDI r2, 390
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
