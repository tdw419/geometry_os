; DESCRIPTION: Renders a purple line between points (8, 222) and (158, 6).
; PLAN: r0=8(x1), r1=222(y1), r2=158(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 222
LDI r2, 158
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
