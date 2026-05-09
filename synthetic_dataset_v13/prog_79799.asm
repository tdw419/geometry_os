; DESCRIPTION: Places a purple line segment connecting (58, 186) to (200, 0).
; PLAN: r0=58(x1), r1=186(y1), r2=200(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 186
LDI r2, 200
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
