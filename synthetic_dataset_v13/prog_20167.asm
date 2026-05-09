; DESCRIPTION: Places a purple line segment connecting (430, 22) to (352, 130).
; PLAN: r0=430(x1), r1=22(y1), r2=352(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 22
LDI r2, 352
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
