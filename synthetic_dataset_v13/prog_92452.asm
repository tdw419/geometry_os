; DESCRIPTION: Places a orange line segment connecting (439, 85) to (223, 58).
; PLAN: r0=439(x1), r1=85(y1), r2=223(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 85
LDI r2, 223
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
