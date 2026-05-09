; DESCRIPTION: Places a purple line segment connecting (21, 137) to (271, 118).
; PLAN: r0=21(x1), r1=137(y1), r2=271(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 137
LDI r2, 271
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
