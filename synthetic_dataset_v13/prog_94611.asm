; DESCRIPTION: Places a orange line segment connecting (323, 3) to (160, 191).
; PLAN: r0=323(x1), r1=3(y1), r2=160(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 3
LDI r2, 160
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
