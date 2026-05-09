; DESCRIPTION: Renders a red line between points (315, 96) and (506, 147).
; PLAN: r0=315(x1), r1=96(y1), r2=506(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 96
LDI r2, 506
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
