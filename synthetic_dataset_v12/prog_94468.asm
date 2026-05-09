; DESCRIPTION: Renders a purple line between points (119, 44) and (102, 80).
; PLAN: r0=119(x1), r1=44(y1), r2=102(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 44
LDI r2, 102
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
