; DESCRIPTION: Places a purple line segment connecting (98, 252) to (430, 201).
; PLAN: r0=98(x1), r1=252(y1), r2=430(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 252
LDI r2, 430
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
