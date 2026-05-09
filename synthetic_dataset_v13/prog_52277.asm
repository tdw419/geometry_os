; DESCRIPTION: Places a purple line segment connecting (505, 9) to (491, 65).
; PLAN: r0=505(x1), r1=9(y1), r2=491(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 9
LDI r2, 491
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
