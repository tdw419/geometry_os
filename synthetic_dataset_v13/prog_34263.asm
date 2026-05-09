; DESCRIPTION: Renders a blue line between points (118, 170) and (217, 123).
; PLAN: r0=118(x1), r1=170(y1), r2=217(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 170
LDI r2, 217
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
