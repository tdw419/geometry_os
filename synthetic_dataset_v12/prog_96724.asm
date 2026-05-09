; DESCRIPTION: Places a green line segment connecting (360, 190) to (314, 99).
; PLAN: r0=360(x1), r1=190(y1), r2=314(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 190
LDI r2, 314
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
