; DESCRIPTION: Places a purple line segment connecting (303, 170) to (506, 153).
; PLAN: r0=303(x1), r1=170(y1), r2=506(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 170
LDI r2, 506
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
