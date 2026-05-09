; DESCRIPTION: Places a orange line segment connecting (7, 149) to (205, 100).
; PLAN: r0=7(x1), r1=149(y1), r2=205(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 149
LDI r2, 205
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
