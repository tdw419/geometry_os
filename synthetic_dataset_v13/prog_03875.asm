; DESCRIPTION: Places a orange line segment connecting (5, 172) to (462, 49).
; PLAN: r0=5(x1), r1=172(y1), r2=462(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 172
LDI r2, 462
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
