; DESCRIPTION: Renders a black line between points (271, 147) and (486, 153).
; PLAN: r0=271(x1), r1=147(y1), r2=486(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 147
LDI r2, 486
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
