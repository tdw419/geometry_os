; DESCRIPTION: Renders a yellow line between points (142, 17) and (190, 185).
; PLAN: r0=142(x1), r1=17(y1), r2=190(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 17
LDI r2, 190
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
