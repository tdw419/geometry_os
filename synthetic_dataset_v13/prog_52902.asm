; DESCRIPTION: Places a orange line segment connecting (67, 175) to (339, 137).
; PLAN: r0=67(x1), r1=175(y1), r2=339(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 175
LDI r2, 339
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
