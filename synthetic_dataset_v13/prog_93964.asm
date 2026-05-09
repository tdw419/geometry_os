; DESCRIPTION: Places a purple line segment connecting (181, 119) to (311, 41).
; PLAN: r0=181(x1), r1=119(y1), r2=311(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 119
LDI r2, 311
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
