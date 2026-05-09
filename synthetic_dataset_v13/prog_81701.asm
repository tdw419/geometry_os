; DESCRIPTION: Places a orange line segment connecting (258, 19) to (244, 44).
; PLAN: r0=258(x1), r1=19(y1), r2=244(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 19
LDI r2, 244
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
