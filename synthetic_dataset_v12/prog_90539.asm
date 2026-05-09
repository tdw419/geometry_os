; DESCRIPTION: Renders a purple line between points (345, 36) and (484, 88).
; PLAN: r0=345(x1), r1=36(y1), r2=484(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 36
LDI r2, 484
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
