; DESCRIPTION: Renders a magenta line between points (361, 198) and (171, 147).
; PLAN: r0=361(x1), r1=198(y1), r2=171(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 198
LDI r2, 171
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
