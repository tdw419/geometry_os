; DESCRIPTION: Places a orange line segment connecting (124, 185) to (10, 131).
; PLAN: r0=124(x1), r1=185(y1), r2=10(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 185
LDI r2, 10
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
