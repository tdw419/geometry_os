; DESCRIPTION: Renders a purple line between points (75, 99) and (93, 98).
; PLAN: r0=75(x1), r1=99(y1), r2=93(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 99
LDI r2, 93
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
