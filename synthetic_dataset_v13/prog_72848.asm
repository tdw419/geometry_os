; DESCRIPTION: Renders a black line between points (476, 71) and (314, 208).
; PLAN: r0=476(x1), r1=71(y1), r2=314(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 71
LDI r2, 314
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
