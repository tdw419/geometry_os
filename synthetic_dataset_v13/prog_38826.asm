; DESCRIPTION: Places a blue line segment connecting (7, 41) to (472, 106).
; PLAN: r0=7(x1), r1=41(y1), r2=472(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 41
LDI r2, 472
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
