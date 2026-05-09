; DESCRIPTION: Places a orange line segment connecting (201, 215) to (68, 162).
; PLAN: r0=201(x1), r1=215(y1), r2=68(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 215
LDI r2, 68
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
