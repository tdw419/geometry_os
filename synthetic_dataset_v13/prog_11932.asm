; DESCRIPTION: Renders a blue line between points (278, 99) and (77, 169).
; PLAN: r0=278(x1), r1=99(y1), r2=77(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 99
LDI r2, 77
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
