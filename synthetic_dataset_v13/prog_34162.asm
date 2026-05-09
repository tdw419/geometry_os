; DESCRIPTION: Places a orange line segment connecting (328, 161) to (241, 216).
; PLAN: r0=328(x1), r1=161(y1), r2=241(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 161
LDI r2, 241
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
