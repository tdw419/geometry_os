; DESCRIPTION: Renders a blue line between points (22, 104) and (323, 118).
; PLAN: r0=22(x1), r1=104(y1), r2=323(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 104
LDI r2, 323
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
