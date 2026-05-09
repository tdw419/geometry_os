; DESCRIPTION: Places a red line segment connecting (448, 123) to (459, 108).
; PLAN: r0=448(x1), r1=123(y1), r2=459(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 123
LDI r2, 459
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
