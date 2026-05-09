; DESCRIPTION: Renders a purple line between points (143, 139) and (138, 84).
; PLAN: r0=143(x1), r1=139(y1), r2=138(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 139
LDI r2, 138
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
