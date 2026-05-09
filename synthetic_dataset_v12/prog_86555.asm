; DESCRIPTION: Places a orange line segment connecting (419, 133) to (230, 1).
; PLAN: r0=419(x1), r1=133(y1), r2=230(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 133
LDI r2, 230
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
