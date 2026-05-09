; DESCRIPTION: Places a orange line segment connecting (433, 105) to (364, 12).
; PLAN: r0=433(x1), r1=105(y1), r2=364(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 105
LDI r2, 364
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
