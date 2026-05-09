; DESCRIPTION: Places a purple line segment connecting (124, 50) to (423, 254).
; PLAN: r0=124(x1), r1=50(y1), r2=423(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 50
LDI r2, 423
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
