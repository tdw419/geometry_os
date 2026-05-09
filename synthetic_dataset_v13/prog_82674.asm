; DESCRIPTION: Places a purple line segment connecting (135, 132) to (452, 230).
; PLAN: r0=135(x1), r1=132(y1), r2=452(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 132
LDI r2, 452
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
