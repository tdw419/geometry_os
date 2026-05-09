; DESCRIPTION: Places a purple line segment connecting (43, 15) to (9, 67).
; PLAN: r0=43(x1), r1=15(y1), r2=9(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 15
LDI r2, 9
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
