; DESCRIPTION: Renders a blue line between points (395, 147) and (376, 86).
; PLAN: r0=395(x1), r1=147(y1), r2=376(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 147
LDI r2, 376
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
