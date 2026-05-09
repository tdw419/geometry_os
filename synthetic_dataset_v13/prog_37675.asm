; DESCRIPTION: Renders a magenta line between points (147, 55) and (256, 145).
; PLAN: r0=147(x1), r1=55(y1), r2=256(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 55
LDI r2, 256
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
