; DESCRIPTION: Renders a yellow line between points (504, 145) and (355, 118).
; PLAN: r0=504(x1), r1=145(y1), r2=355(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 145
LDI r2, 355
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
