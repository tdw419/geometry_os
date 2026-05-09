; DESCRIPTION: Places a orange line segment connecting (229, 88) to (170, 89).
; PLAN: r0=229(x1), r1=88(y1), r2=170(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 88
LDI r2, 170
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
