; DESCRIPTION: Renders a purple line between points (61, 85) and (380, 147).
; PLAN: r0=61(x1), r1=85(y1), r2=380(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 85
LDI r2, 380
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
