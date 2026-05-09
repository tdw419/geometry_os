; DESCRIPTION: Places a orange line segment connecting (155, 11) to (181, 196).
; PLAN: r0=155(x1), r1=11(y1), r2=181(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 11
LDI r2, 181
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
