; DESCRIPTION: Places a orange line segment connecting (70, 135) to (114, 22).
; PLAN: r0=70(x1), r1=135(y1), r2=114(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 135
LDI r2, 114
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
