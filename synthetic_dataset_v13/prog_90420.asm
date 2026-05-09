; DESCRIPTION: Places a orange line segment connecting (357, 114) to (357, 216).
; PLAN: r0=357(x1), r1=114(y1), r2=357(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 114
LDI r2, 357
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
