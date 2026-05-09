; DESCRIPTION: Renders a purple line between points (241, 252) and (435, 148).
; PLAN: r0=241(x1), r1=252(y1), r2=435(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 252
LDI r2, 435
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
