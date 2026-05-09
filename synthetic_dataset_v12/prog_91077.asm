; DESCRIPTION: Renders a magenta line between points (147, 0) and (119, 157).
; PLAN: r0=147(x1), r1=0(y1), r2=119(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 0
LDI r2, 119
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
