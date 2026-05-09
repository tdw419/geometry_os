; DESCRIPTION: Places a orange line segment connecting (337, 45) to (457, 144).
; PLAN: r0=337(x1), r1=45(y1), r2=457(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 45
LDI r2, 457
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
