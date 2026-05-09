; DESCRIPTION: Places a orange line segment connecting (68, 91) to (497, 229).
; PLAN: r0=68(x1), r1=91(y1), r2=497(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 91
LDI r2, 497
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
