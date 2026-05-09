; DESCRIPTION: Places a orange line segment connecting (129, 220) to (109, 136).
; PLAN: r0=129(x1), r1=220(y1), r2=109(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 220
LDI r2, 109
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
