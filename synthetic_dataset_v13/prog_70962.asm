; DESCRIPTION: Renders a yellow line between points (12, 158) and (158, 216).
; PLAN: r0=12(x1), r1=158(y1), r2=158(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 158
LDI r2, 158
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
