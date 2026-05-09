; DESCRIPTION: Places a orange line segment connecting (218, 60) to (138, 22).
; PLAN: r0=218(x1), r1=60(y1), r2=138(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 60
LDI r2, 138
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
