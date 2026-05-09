; DESCRIPTION: Places a purple line segment connecting (124, 229) to (411, 137).
; PLAN: r0=124(x1), r1=229(y1), r2=411(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 229
LDI r2, 411
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
