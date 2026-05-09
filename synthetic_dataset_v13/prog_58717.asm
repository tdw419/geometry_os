; DESCRIPTION: Renders a yellow line between points (336, 202) and (147, 233).
; PLAN: r0=336(x1), r1=202(y1), r2=147(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 202
LDI r2, 147
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
