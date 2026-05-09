; DESCRIPTION: Places a purple line segment connecting (414, 201) to (251, 229).
; PLAN: r0=414(x1), r1=201(y1), r2=251(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 201
LDI r2, 251
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
