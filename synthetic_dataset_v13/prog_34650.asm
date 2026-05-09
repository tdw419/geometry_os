; DESCRIPTION: Places a orange line segment connecting (87, 44) to (2, 22).
; PLAN: r0=87(x1), r1=44(y1), r2=2(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 44
LDI r2, 2
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
