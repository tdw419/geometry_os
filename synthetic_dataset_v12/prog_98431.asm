; DESCRIPTION: Renders a yellow line between points (132, 147) and (256, 202).
; PLAN: r0=132(x1), r1=147(y1), r2=256(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 147
LDI r2, 256
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
