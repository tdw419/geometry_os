; DESCRIPTION: Places a purple line segment connecting (31, 104) to (374, 180).
; PLAN: r0=31(x1), r1=104(y1), r2=374(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 104
LDI r2, 374
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
