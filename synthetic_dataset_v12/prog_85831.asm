; DESCRIPTION: Places a orange line segment connecting (389, 170) to (403, 39).
; PLAN: r0=389(x1), r1=170(y1), r2=403(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 170
LDI r2, 403
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
