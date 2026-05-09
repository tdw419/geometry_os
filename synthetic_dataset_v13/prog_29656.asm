; DESCRIPTION: Renders a yellow line between points (147, 176) and (137, 164).
; PLAN: r0=147(x1), r1=176(y1), r2=137(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 176
LDI r2, 137
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
