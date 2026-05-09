; DESCRIPTION: Places a orange line segment connecting (158, 84) to (279, 133).
; PLAN: r0=158(x1), r1=84(y1), r2=279(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 84
LDI r2, 279
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
