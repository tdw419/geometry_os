; DESCRIPTION: Renders a yellow line between points (112, 3) and (358, 129).
; PLAN: r0=112(x1), r1=3(y1), r2=358(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 3
LDI r2, 358
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
