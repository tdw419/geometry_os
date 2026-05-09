; DESCRIPTION: Places a purple line segment connecting (334, 58) to (475, 155).
; PLAN: r0=334(x1), r1=58(y1), r2=475(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 58
LDI r2, 475
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
