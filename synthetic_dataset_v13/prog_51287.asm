; DESCRIPTION: Places a orange line segment connecting (78, 148) to (261, 11).
; PLAN: r0=78(x1), r1=148(y1), r2=261(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 148
LDI r2, 261
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
