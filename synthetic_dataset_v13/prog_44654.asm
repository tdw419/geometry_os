; DESCRIPTION: Places a blue line segment connecting (56, 170) to (25, 47).
; PLAN: r0=56(x1), r1=170(y1), r2=25(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 170
LDI r2, 25
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
