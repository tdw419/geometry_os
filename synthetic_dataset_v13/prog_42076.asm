; DESCRIPTION: Renders a purple line between points (462, 95) and (40, 17).
; PLAN: r0=462(x1), r1=95(y1), r2=40(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 95
LDI r2, 40
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
