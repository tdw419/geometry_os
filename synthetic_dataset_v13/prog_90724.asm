; DESCRIPTION: Renders a magenta line between points (137, 154) and (138, 147).
; PLAN: r0=137(x1), r1=154(y1), r2=138(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 154
LDI r2, 138
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
