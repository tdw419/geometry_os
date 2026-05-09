; DESCRIPTION: Places a orange line segment connecting (366, 15) to (102, 230).
; PLAN: r0=366(x1), r1=15(y1), r2=102(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 15
LDI r2, 102
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
