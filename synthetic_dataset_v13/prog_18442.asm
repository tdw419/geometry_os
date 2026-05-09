; DESCRIPTION: Renders a purple line between points (435, 156) and (193, 104).
; PLAN: r0=435(x1), r1=156(y1), r2=193(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 156
LDI r2, 193
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
