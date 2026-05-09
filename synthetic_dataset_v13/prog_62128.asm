; DESCRIPTION: Places a purple line segment connecting (55, 74) to (491, 56).
; PLAN: r0=55(x1), r1=74(y1), r2=491(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 74
LDI r2, 491
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
