; DESCRIPTION: Places a orange line segment connecting (505, 47) to (357, 172).
; PLAN: r0=505(x1), r1=47(y1), r2=357(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 47
LDI r2, 357
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
