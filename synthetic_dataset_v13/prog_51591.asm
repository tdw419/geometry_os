; DESCRIPTION: Renders a yellow line between points (312, 202) and (357, 136).
; PLAN: r0=312(x1), r1=202(y1), r2=357(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 202
LDI r2, 357
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
