; DESCRIPTION: Renders a black line between points (448, 147) and (281, 2).
; PLAN: r0=448(x1), r1=147(y1), r2=281(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 147
LDI r2, 281
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
