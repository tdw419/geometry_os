; DESCRIPTION: Places a orange line segment connecting (53, 22) to (65, 1).
; PLAN: r0=53(x1), r1=22(y1), r2=65(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 22
LDI r2, 65
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
