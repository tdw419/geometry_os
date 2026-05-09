; DESCRIPTION: Places a purple line segment connecting (363, 135) to (491, 140).
; PLAN: r0=363(x1), r1=135(y1), r2=491(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 135
LDI r2, 491
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
