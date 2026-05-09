; DESCRIPTION: Places a orange line segment connecting (363, 30) to (457, 28).
; PLAN: r0=363(x1), r1=30(y1), r2=457(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 30
LDI r2, 457
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
