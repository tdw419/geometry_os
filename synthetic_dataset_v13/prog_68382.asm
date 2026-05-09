; DESCRIPTION: Renders a purple line between points (410, 170) and (58, 74).
; PLAN: r0=410(x1), r1=170(y1), r2=58(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 170
LDI r2, 58
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
