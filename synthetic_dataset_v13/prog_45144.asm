; DESCRIPTION: Places a orange line segment connecting (508, 120) to (190, 118).
; PLAN: r0=508(x1), r1=120(y1), r2=190(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 120
LDI r2, 190
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
