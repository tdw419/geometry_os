; DESCRIPTION: Places a orange line segment connecting (413, 3) to (233, 34).
; PLAN: r0=413(x1), r1=3(y1), r2=233(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 3
LDI r2, 233
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
