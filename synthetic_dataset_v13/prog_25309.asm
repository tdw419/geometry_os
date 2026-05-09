; DESCRIPTION: Renders a purple line between points (147, 52) and (361, 164).
; PLAN: r0=147(x1), r1=52(y1), r2=361(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 52
LDI r2, 361
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
