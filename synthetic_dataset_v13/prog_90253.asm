; DESCRIPTION: Draws a orange line from (139, 200) to (119, 89).
; PLAN: r0=139(x1), r1=200(y1), r2=119(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 200
LDI r2, 119
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
