; DESCRIPTION: Places a orange line segment connecting (350, 100) to (444, 221).
; PLAN: r0=350(x1), r1=100(y1), r2=444(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 100
LDI r2, 444
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
