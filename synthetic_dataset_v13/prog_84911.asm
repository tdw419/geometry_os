; DESCRIPTION: Places a orange line segment connecting (169, 238) to (110, 131).
; PLAN: r0=169(x1), r1=238(y1), r2=110(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 238
LDI r2, 110
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
