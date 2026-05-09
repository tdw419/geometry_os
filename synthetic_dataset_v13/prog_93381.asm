; DESCRIPTION: Renders a blue line between points (147, 73) and (169, 154).
; PLAN: r0=147(x1), r1=73(y1), r2=169(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 73
LDI r2, 169
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
