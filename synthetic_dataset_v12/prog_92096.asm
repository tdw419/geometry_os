; DESCRIPTION: Places a orange line segment connecting (201, 184) to (370, 254).
; PLAN: r0=201(x1), r1=184(y1), r2=370(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 184
LDI r2, 370
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
