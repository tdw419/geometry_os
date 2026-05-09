; DESCRIPTION: Places a purple line segment connecting (163, 39) to (161, 12).
; PLAN: r0=163(x1), r1=39(y1), r2=161(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 39
LDI r2, 161
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
