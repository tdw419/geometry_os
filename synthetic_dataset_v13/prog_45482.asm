; DESCRIPTION: Renders a blue line between points (151, 99) and (314, 106).
; PLAN: r0=151(x1), r1=99(y1), r2=314(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 99
LDI r2, 314
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
