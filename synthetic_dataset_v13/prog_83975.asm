; DESCRIPTION: Places a orange line segment connecting (454, 133) to (101, 93).
; PLAN: r0=454(x1), r1=133(y1), r2=101(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 133
LDI r2, 101
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
