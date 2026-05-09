; DESCRIPTION: Renders a purple line between points (95, 254) and (370, 169).
; PLAN: r0=95(x1), r1=254(y1), r2=370(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 254
LDI r2, 370
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
