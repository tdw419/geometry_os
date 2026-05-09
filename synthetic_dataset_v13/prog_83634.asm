; DESCRIPTION: Places a orange line segment connecting (371, 36) to (250, 130).
; PLAN: r0=371(x1), r1=36(y1), r2=250(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 36
LDI r2, 250
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
