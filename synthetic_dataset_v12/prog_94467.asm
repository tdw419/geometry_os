; DESCRIPTION: Renders a red line between points (420, 73) and (26, 147).
; PLAN: r0=420(x1), r1=73(y1), r2=26(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 73
LDI r2, 26
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
