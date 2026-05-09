; DESCRIPTION: Places a orange line segment connecting (10, 51) to (158, 194).
; PLAN: r0=10(x1), r1=51(y1), r2=158(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 51
LDI r2, 158
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
