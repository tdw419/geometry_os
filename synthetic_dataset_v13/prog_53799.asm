; DESCRIPTION: Places a orange line segment connecting (349, 227) to (395, 70).
; PLAN: r0=349(x1), r1=227(y1), r2=395(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 227
LDI r2, 395
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
