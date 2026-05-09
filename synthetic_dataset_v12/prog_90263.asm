; DESCRIPTION: Places a orange line segment connecting (67, 198) to (109, 79).
; PLAN: r0=67(x1), r1=198(y1), r2=109(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 198
LDI r2, 109
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
