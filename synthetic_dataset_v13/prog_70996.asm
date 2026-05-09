; DESCRIPTION: Places a orange line segment connecting (62, 188) to (326, 105).
; PLAN: r0=62(x1), r1=188(y1), r2=326(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 188
LDI r2, 326
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
