; DESCRIPTION: Places a orange line segment connecting (248, 106) to (61, 118).
; PLAN: r0=248(x1), r1=106(y1), r2=61(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 106
LDI r2, 61
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
