; DESCRIPTION: Places a orange line segment connecting (347, 158) to (81, 152).
; PLAN: r0=347(x1), r1=158(y1), r2=81(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 158
LDI r2, 81
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
