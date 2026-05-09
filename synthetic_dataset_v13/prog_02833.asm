; DESCRIPTION: Places a orange line segment connecting (312, 2) to (223, 133).
; PLAN: r0=312(x1), r1=2(y1), r2=223(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 2
LDI r2, 223
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
