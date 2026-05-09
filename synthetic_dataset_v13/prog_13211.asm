; DESCRIPTION: Renders a purple line between points (152, 89) and (186, 153).
; PLAN: r0=152(x1), r1=89(y1), r2=186(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 89
LDI r2, 186
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
