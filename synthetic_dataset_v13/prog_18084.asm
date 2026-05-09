; DESCRIPTION: Places a orange line segment connecting (323, 54) to (208, 72).
; PLAN: r0=323(x1), r1=54(y1), r2=208(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 54
LDI r2, 208
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
