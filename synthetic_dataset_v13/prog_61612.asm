; DESCRIPTION: Places a orange line segment connecting (464, 18) to (100, 129).
; PLAN: r0=464(x1), r1=18(y1), r2=100(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 18
LDI r2, 100
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
