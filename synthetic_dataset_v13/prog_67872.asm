; DESCRIPTION: Renders a blue line between points (77, 147) and (68, 103).
; PLAN: r0=77(x1), r1=147(y1), r2=68(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 147
LDI r2, 68
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
