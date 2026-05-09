; DESCRIPTION: Renders a purple line between points (181, 170) and (243, 24).
; PLAN: r0=181(x1), r1=170(y1), r2=243(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 170
LDI r2, 243
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
