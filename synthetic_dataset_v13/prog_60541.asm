; DESCRIPTION: Places a orange line segment connecting (3, 124) to (395, 120).
; PLAN: r0=3(x1), r1=124(y1), r2=395(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 124
LDI r2, 395
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
