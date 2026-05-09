; DESCRIPTION: Places a purple line segment connecting (223, 123) to (251, 201).
; PLAN: r0=223(x1), r1=123(y1), r2=251(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 123
LDI r2, 251
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
