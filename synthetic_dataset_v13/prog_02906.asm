; DESCRIPTION: Renders a blue line between points (467, 147) and (498, 33).
; PLAN: r0=467(x1), r1=147(y1), r2=498(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 147
LDI r2, 498
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
