; DESCRIPTION: Places a purple line segment connecting (491, 246) to (363, 0).
; PLAN: r0=491(x1), r1=246(y1), r2=363(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 246
LDI r2, 363
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
