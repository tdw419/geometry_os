; DESCRIPTION: Places a orange line segment connecting (24, 1) to (501, 180).
; PLAN: r0=24(x1), r1=1(y1), r2=501(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 1
LDI r2, 501
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
