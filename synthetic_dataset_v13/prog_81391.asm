; DESCRIPTION: Places a orange line segment connecting (132, 89) to (311, 35).
; PLAN: r0=132(x1), r1=89(y1), r2=311(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 89
LDI r2, 311
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
