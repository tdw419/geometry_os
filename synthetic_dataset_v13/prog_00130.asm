; DESCRIPTION: Places a orange line segment connecting (87, 211) to (61, 84).
; PLAN: r0=87(x1), r1=211(y1), r2=61(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 211
LDI r2, 61
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
