; DESCRIPTION: Places a orange line segment connecting (205, 104) to (505, 29).
; PLAN: r0=205(x1), r1=104(y1), r2=505(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 104
LDI r2, 505
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
