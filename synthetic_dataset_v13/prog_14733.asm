; DESCRIPTION: Renders a purple line between points (74, 106) and (226, 9).
; PLAN: r0=74(x1), r1=106(y1), r2=226(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 106
LDI r2, 226
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
