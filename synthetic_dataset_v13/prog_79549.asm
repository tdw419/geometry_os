; DESCRIPTION: Places a orange line segment connecting (448, 162) to (151, 38).
; PLAN: r0=448(x1), r1=162(y1), r2=151(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 162
LDI r2, 151
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
