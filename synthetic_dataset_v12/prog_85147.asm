; DESCRIPTION: Places a purple line segment connecting (196, 137) to (331, 238).
; PLAN: r0=196(x1), r1=137(y1), r2=331(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 137
LDI r2, 331
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
