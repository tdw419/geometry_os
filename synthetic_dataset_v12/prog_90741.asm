; DESCRIPTION: Places a orange line segment connecting (6, 91) to (326, 212).
; PLAN: r0=6(x1), r1=91(y1), r2=326(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 91
LDI r2, 326
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
