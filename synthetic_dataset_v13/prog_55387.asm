; DESCRIPTION: Places a orange line segment connecting (155, 30) to (75, 92).
; PLAN: r0=155(x1), r1=30(y1), r2=75(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 30
LDI r2, 75
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
