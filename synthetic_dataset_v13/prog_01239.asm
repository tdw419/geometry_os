; DESCRIPTION: Places a orange line segment connecting (244, 21) to (302, 13).
; PLAN: r0=244(x1), r1=21(y1), r2=302(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 21
LDI r2, 302
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
