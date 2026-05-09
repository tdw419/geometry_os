; DESCRIPTION: Places a orange line segment connecting (232, 148) to (372, 68).
; PLAN: r0=232(x1), r1=148(y1), r2=372(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 148
LDI r2, 372
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
