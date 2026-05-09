; DESCRIPTION: Places a orange line segment connecting (38, 201) to (422, 69).
; PLAN: r0=38(x1), r1=201(y1), r2=422(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 201
LDI r2, 422
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
