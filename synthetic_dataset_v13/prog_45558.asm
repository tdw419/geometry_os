; DESCRIPTION: Places a purple line segment connecting (208, 163) to (137, 230).
; PLAN: r0=208(x1), r1=163(y1), r2=137(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 163
LDI r2, 137
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
