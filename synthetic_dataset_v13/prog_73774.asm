; DESCRIPTION: Renders a red line between points (273, 147) and (381, 5).
; PLAN: r0=273(x1), r1=147(y1), r2=381(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 147
LDI r2, 381
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
