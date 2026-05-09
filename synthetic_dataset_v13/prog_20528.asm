; DESCRIPTION: Renders a purple line between points (170, 202) and (158, 133).
; PLAN: r0=170(x1), r1=202(y1), r2=158(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 202
LDI r2, 158
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
