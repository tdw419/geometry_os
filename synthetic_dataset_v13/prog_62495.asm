; DESCRIPTION: Renders a purple line between points (96, 161) and (314, 199).
; PLAN: r0=96(x1), r1=161(y1), r2=314(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 161
LDI r2, 314
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
