; DESCRIPTION: Places a purple line segment connecting (170, 216) to (38, 229).
; PLAN: r0=170(x1), r1=216(y1), r2=38(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 216
LDI r2, 38
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
