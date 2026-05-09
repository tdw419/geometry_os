; DESCRIPTION: Places a orange line segment connecting (47, 190) to (101, 35).
; PLAN: r0=47(x1), r1=190(y1), r2=101(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 190
LDI r2, 101
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
