; DESCRIPTION: Places a purple line segment connecting (201, 229) to (291, 51).
; PLAN: r0=201(x1), r1=229(y1), r2=291(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 229
LDI r2, 291
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
