; DESCRIPTION: Places a orange line segment connecting (115, 70) to (14, 58).
; PLAN: r0=115(x1), r1=70(y1), r2=14(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 70
LDI r2, 14
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
