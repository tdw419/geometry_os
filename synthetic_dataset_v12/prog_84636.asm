; DESCRIPTION: Places a orange line segment connecting (21, 132) to (3, 35).
; PLAN: r0=21(x1), r1=132(y1), r2=3(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 132
LDI r2, 3
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
