; DESCRIPTION: Renders a purple line between points (138, 8) and (112, 3).
; PLAN: r0=138(x1), r1=8(y1), r2=112(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 8
LDI r2, 112
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
