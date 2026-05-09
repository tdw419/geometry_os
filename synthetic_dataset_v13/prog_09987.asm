; DESCRIPTION: Places a purple line segment connecting (302, 252) to (330, 162).
; PLAN: r0=302(x1), r1=252(y1), r2=330(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 252
LDI r2, 330
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
