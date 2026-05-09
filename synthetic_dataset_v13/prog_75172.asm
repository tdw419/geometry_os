; DESCRIPTION: Places a orange line segment connecting (484, 16) to (200, 59).
; PLAN: r0=484(x1), r1=16(y1), r2=200(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 16
LDI r2, 200
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
