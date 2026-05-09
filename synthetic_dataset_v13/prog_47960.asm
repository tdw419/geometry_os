; DESCRIPTION: Places a orange line segment connecting (413, 121) to (349, 22).
; PLAN: r0=413(x1), r1=121(y1), r2=349(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 121
LDI r2, 349
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
