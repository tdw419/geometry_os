; DESCRIPTION: Places a orange line segment connecting (61, 123) to (160, 60).
; PLAN: r0=61(x1), r1=123(y1), r2=160(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 123
LDI r2, 160
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
