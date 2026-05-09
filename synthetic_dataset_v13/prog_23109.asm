; DESCRIPTION: Places a orange line segment connecting (88, 80) to (280, 157).
; PLAN: r0=88(x1), r1=80(y1), r2=280(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 80
LDI r2, 280
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
