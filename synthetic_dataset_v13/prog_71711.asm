; DESCRIPTION: Places a blue line segment connecting (491, 158) to (430, 169).
; PLAN: r0=491(x1), r1=158(y1), r2=430(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 158
LDI r2, 430
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
