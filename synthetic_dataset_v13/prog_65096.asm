; DESCRIPTION: Places a orange line segment connecting (372, 29) to (162, 9).
; PLAN: r0=372(x1), r1=29(y1), r2=162(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 29
LDI r2, 162
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
