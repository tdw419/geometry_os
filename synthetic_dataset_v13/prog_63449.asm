; DESCRIPTION: Renders a black line between points (78, 147) and (358, 235).
; PLAN: r0=78(x1), r1=147(y1), r2=358(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 147
LDI r2, 358
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
