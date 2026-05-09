; DESCRIPTION: Renders a purple line between points (311, 170) and (20, 169).
; PLAN: r0=311(x1), r1=170(y1), r2=20(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 170
LDI r2, 20
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
