; DESCRIPTION: Places a orange line segment connecting (176, 175) to (78, 188).
; PLAN: r0=176(x1), r1=175(y1), r2=78(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 175
LDI r2, 78
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
