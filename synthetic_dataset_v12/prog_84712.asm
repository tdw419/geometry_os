; DESCRIPTION: Places a orange line segment connecting (14, 162) to (317, 202).
; PLAN: r0=14(x1), r1=162(y1), r2=317(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 162
LDI r2, 317
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
