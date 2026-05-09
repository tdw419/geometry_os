; DESCRIPTION: Places a orange line segment connecting (147, 44) to (100, 165).
; PLAN: r0=147(x1), r1=44(y1), r2=100(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 44
LDI r2, 100
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
