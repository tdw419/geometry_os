; DESCRIPTION: Places a purple line segment connecting (229, 226) to (350, 201).
; PLAN: r0=229(x1), r1=226(y1), r2=350(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 226
LDI r2, 350
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
