; DESCRIPTION: Renders a blue line between points (312, 147) and (146, 25).
; PLAN: r0=312(x1), r1=147(y1), r2=146(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 147
LDI r2, 146
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
