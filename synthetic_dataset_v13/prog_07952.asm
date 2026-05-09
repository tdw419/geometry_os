; DESCRIPTION: Places a orange line segment connecting (435, 133) to (378, 194).
; PLAN: r0=435(x1), r1=133(y1), r2=378(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 133
LDI r2, 378
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
