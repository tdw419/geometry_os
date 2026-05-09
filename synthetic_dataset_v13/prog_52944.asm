; DESCRIPTION: Renders a purple line between points (115, 140) and (466, 84).
; PLAN: r0=115(x1), r1=140(y1), r2=466(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 140
LDI r2, 466
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
