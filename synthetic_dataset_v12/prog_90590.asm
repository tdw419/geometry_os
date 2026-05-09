; DESCRIPTION: Places a orange line segment connecting (486, 145) to (75, 10).
; PLAN: r0=486(x1), r1=145(y1), r2=75(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 145
LDI r2, 75
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
