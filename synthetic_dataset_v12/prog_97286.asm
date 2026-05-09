; DESCRIPTION: Places a orange line segment connecting (56, 142) to (259, 2).
; PLAN: r0=56(x1), r1=142(y1), r2=259(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 142
LDI r2, 259
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
