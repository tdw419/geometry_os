; DESCRIPTION: Places a orange line segment connecting (259, 18) to (336, 145).
; PLAN: r0=259(x1), r1=18(y1), r2=336(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 18
LDI r2, 336
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
