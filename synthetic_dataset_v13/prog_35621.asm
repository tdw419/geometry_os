; DESCRIPTION: Renders a purple line between points (187, 216) and (118, 48).
; PLAN: r0=187(x1), r1=216(y1), r2=118(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 216
LDI r2, 118
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
