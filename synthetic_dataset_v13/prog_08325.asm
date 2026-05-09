; DESCRIPTION: Places a purple line segment connecting (167, 147) to (485, 35).
; PLAN: r0=167(x1), r1=147(y1), r2=485(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 147
LDI r2, 485
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
