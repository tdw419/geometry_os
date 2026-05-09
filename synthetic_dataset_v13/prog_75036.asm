; DESCRIPTION: Renders a magenta line between points (273, 143) and (147, 135).
; PLAN: r0=273(x1), r1=143(y1), r2=147(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 143
LDI r2, 147
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
