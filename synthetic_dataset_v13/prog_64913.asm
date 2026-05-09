; DESCRIPTION: Renders a yellow line between points (407, 147) and (237, 9).
; PLAN: r0=407(x1), r1=147(y1), r2=237(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 147
LDI r2, 237
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
