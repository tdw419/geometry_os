; DESCRIPTION: Renders a magenta line between points (7, 13) and (147, 145).
; PLAN: r0=7(x1), r1=13(y1), r2=147(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 13
LDI r2, 147
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
