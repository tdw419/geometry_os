; DESCRIPTION: Places a blue line segment connecting (432, 118) to (211, 71).
; PLAN: r0=432(x1), r1=118(y1), r2=211(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 118
LDI r2, 211
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
