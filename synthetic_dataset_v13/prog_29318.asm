; DESCRIPTION: Places a orange line segment connecting (67, 141) to (330, 105).
; PLAN: r0=67(x1), r1=141(y1), r2=330(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 141
LDI r2, 330
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
