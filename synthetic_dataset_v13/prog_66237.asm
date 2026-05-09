; DESCRIPTION: Places a red line segment connecting (25, 8) to (468, 97).
; PLAN: r0=25(x1), r1=8(y1), r2=468(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 8
LDI r2, 468
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
