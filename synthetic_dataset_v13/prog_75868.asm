; DESCRIPTION: Places a orange line segment connecting (165, 181) to (448, 101).
; PLAN: r0=165(x1), r1=181(y1), r2=448(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 181
LDI r2, 448
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
