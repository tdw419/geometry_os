; DESCRIPTION: Places a purple line segment connecting (4, 119) to (91, 106).
; PLAN: r0=4(x1), r1=119(y1), r2=91(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 119
LDI r2, 91
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
