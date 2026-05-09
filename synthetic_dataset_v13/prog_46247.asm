; DESCRIPTION: Places a orange line segment connecting (402, 122) to (14, 145).
; PLAN: r0=402(x1), r1=122(y1), r2=14(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 122
LDI r2, 14
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
