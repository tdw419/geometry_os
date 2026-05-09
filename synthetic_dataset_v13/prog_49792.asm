; DESCRIPTION: Renders a purple line between points (367, 147) and (85, 177).
; PLAN: r0=367(x1), r1=147(y1), r2=85(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 147
LDI r2, 85
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
