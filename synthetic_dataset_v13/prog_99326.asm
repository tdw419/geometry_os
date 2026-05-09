; DESCRIPTION: Places a orange line segment connecting (117, 84) to (145, 0).
; PLAN: r0=117(x1), r1=84(y1), r2=145(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 84
LDI r2, 145
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
