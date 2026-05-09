; DESCRIPTION: Places a orange line segment connecting (457, 229) to (130, 142).
; PLAN: r0=457(x1), r1=229(y1), r2=130(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 229
LDI r2, 130
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
