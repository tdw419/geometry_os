; DESCRIPTION: Renders a red line between points (253, 10) and (147, 22).
; PLAN: r0=253(x1), r1=10(y1), r2=147(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 10
LDI r2, 147
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
