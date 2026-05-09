; DESCRIPTION: Places a orange line segment connecting (204, 201) to (263, 68).
; PLAN: r0=204(x1), r1=201(y1), r2=263(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 201
LDI r2, 263
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
