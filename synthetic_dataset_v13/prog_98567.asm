; DESCRIPTION: Renders a yellow line between points (18, 216) and (1, 118).
; PLAN: r0=18(x1), r1=216(y1), r2=1(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 216
LDI r2, 1
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
