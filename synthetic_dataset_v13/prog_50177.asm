; DESCRIPTION: Places a orange line segment connecting (338, 23) to (153, 49).
; PLAN: r0=338(x1), r1=23(y1), r2=153(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 23
LDI r2, 153
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
