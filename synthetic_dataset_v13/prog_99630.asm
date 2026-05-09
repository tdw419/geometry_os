; DESCRIPTION: Places a orange line segment connecting (423, 90) to (96, 33).
; PLAN: r0=423(x1), r1=90(y1), r2=96(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 90
LDI r2, 96
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
