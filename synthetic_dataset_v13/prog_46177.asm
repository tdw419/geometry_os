; DESCRIPTION: Places a orange line segment connecting (58, 36) to (104, 85).
; PLAN: r0=58(x1), r1=36(y1), r2=104(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 36
LDI r2, 104
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
