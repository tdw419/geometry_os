; DESCRIPTION: Renders a magenta line between points (453, 155) and (486, 145).
; PLAN: r0=453(x1), r1=155(y1), r2=486(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 155
LDI r2, 486
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
