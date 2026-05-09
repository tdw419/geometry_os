; DESCRIPTION: Places a orange line segment connecting (395, 9) to (211, 153).
; PLAN: r0=395(x1), r1=9(y1), r2=211(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 9
LDI r2, 211
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
