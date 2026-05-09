; DESCRIPTION: Places a blue line segment connecting (102, 170) to (39, 70).
; PLAN: r0=102(x1), r1=170(y1), r2=39(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 170
LDI r2, 39
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
