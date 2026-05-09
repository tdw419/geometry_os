; DESCRIPTION: Places a orange line segment connecting (386, 123) to (100, 101).
; PLAN: r0=386(x1), r1=123(y1), r2=100(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 123
LDI r2, 100
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
