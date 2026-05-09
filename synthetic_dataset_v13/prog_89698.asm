; DESCRIPTION: Renders a yellow line between points (362, 136) and (472, 4).
; PLAN: r0=362(x1), r1=136(y1), r2=472(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 136
LDI r2, 472
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
