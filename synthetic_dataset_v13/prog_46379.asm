; DESCRIPTION: Places a purple line segment connecting (472, 170) to (71, 46).
; PLAN: r0=472(x1), r1=170(y1), r2=71(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 170
LDI r2, 71
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
