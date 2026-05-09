; DESCRIPTION: Places a orange line segment connecting (288, 85) to (456, 1).
; PLAN: r0=288(x1), r1=85(y1), r2=456(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 85
LDI r2, 456
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
