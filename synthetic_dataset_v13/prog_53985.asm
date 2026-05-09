; DESCRIPTION: Places a orange line segment connecting (160, 91) to (123, 80).
; PLAN: r0=160(x1), r1=91(y1), r2=123(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 91
LDI r2, 123
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
