; DESCRIPTION: Places a orange line segment connecting (296, 201) to (158, 236).
; PLAN: r0=296(x1), r1=201(y1), r2=158(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 201
LDI r2, 158
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
