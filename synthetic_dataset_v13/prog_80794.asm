; DESCRIPTION: Places a purple line segment connecting (195, 229) to (73, 145).
; PLAN: r0=195(x1), r1=229(y1), r2=73(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 229
LDI r2, 73
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
