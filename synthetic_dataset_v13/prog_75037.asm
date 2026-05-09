; DESCRIPTION: Renders a blue line between points (147, 0) and (46, 158).
; PLAN: r0=147(x1), r1=0(y1), r2=46(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 0
LDI r2, 46
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
