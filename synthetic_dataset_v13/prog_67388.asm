; DESCRIPTION: Places a orange line segment connecting (60, 60) to (355, 108).
; PLAN: r0=60(x1), r1=60(y1), r2=355(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 60
LDI r2, 355
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
