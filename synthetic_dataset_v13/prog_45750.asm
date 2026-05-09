; DESCRIPTION: Renders a purple line between points (216, 14) and (430, 13).
; PLAN: r0=216(x1), r1=14(y1), r2=430(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 14
LDI r2, 430
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
