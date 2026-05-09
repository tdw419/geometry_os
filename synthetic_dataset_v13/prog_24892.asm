; DESCRIPTION: Places a orange line segment connecting (311, 241) to (315, 219).
; PLAN: r0=311(x1), r1=241(y1), r2=315(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 241
LDI r2, 315
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
