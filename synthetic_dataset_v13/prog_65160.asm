; DESCRIPTION: Places a orange line segment connecting (448, 1) to (158, 174).
; PLAN: r0=448(x1), r1=1(y1), r2=158(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 1
LDI r2, 158
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
