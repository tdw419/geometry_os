; DESCRIPTION: Places a green line segment connecting (190, 158) to (501, 80).
; PLAN: r0=190(x1), r1=158(y1), r2=501(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 158
LDI r2, 501
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
