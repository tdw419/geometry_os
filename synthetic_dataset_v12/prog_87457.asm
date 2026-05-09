; DESCRIPTION: Draws a orange line from (431, 84) to (22, 158).
; PLAN: r0=431(x1), r1=84(y1), r2=22(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 84
LDI r2, 22
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
