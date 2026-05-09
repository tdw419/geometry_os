; DESCRIPTION: Renders a magenta line between points (451, 77) and (147, 55).
; PLAN: r0=451(x1), r1=77(y1), r2=147(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 77
LDI r2, 147
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
