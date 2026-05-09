; DESCRIPTION: Places a orange line segment connecting (288, 76) to (19, 130).
; PLAN: r0=288(x1), r1=76(y1), r2=19(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 76
LDI r2, 19
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
