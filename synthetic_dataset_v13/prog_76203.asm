; DESCRIPTION: Renders a yellow line between points (147, 62) and (52, 163).
; PLAN: r0=147(x1), r1=62(y1), r2=52(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 62
LDI r2, 52
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
