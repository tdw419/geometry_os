; DESCRIPTION: Places a purple line segment connecting (232, 45) to (505, 68).
; PLAN: r0=232(x1), r1=45(y1), r2=505(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 45
LDI r2, 505
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
