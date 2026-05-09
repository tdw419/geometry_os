; DESCRIPTION: Renders a purple line between points (95, 145) and (152, 226).
; PLAN: r0=95(x1), r1=145(y1), r2=152(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 145
LDI r2, 152
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
