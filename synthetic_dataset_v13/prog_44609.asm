; DESCRIPTION: Renders a purple line between points (290, 170) and (141, 30).
; PLAN: r0=290(x1), r1=170(y1), r2=141(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 170
LDI r2, 141
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
