; DESCRIPTION: Places a orange line segment connecting (200, 84) to (365, 233).
; PLAN: r0=200(x1), r1=84(y1), r2=365(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 84
LDI r2, 365
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
