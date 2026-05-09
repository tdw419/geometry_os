; DESCRIPTION: Places a orange line segment connecting (169, 90) to (432, 2).
; PLAN: r0=169(x1), r1=90(y1), r2=432(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 90
LDI r2, 432
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
