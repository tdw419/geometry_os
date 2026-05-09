; DESCRIPTION: Places a orange line segment connecting (356, 94) to (7, 74).
; PLAN: r0=356(x1), r1=94(y1), r2=7(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 94
LDI r2, 7
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
