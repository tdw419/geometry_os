; DESCRIPTION: Renders a red line between points (126, 147) and (376, 227).
; PLAN: r0=126(x1), r1=147(y1), r2=376(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 147
LDI r2, 376
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
