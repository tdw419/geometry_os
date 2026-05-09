; DESCRIPTION: Renders a purple line between points (89, 13) and (463, 163).
; PLAN: r0=89(x1), r1=13(y1), r2=463(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 13
LDI r2, 463
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
