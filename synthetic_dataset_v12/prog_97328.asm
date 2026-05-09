; DESCRIPTION: Places a orange line segment connecting (178, 33) to (462, 10).
; PLAN: r0=178(x1), r1=33(y1), r2=462(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 33
LDI r2, 462
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
