; DESCRIPTION: Renders a blue line between points (131, 167) and (147, 180).
; PLAN: r0=131(x1), r1=167(y1), r2=147(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 167
LDI r2, 147
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
