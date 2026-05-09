; DESCRIPTION: Renders a yellow line between points (315, 105) and (438, 169).
; PLAN: r0=315(x1), r1=105(y1), r2=438(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 105
LDI r2, 438
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
