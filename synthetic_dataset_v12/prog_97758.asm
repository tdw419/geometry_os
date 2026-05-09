; DESCRIPTION: Places a orange line segment connecting (149, 66) to (67, 65).
; PLAN: r0=149(x1), r1=66(y1), r2=67(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 66
LDI r2, 67
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
