; DESCRIPTION: Renders a yellow line between points (245, 77) and (227, 159).
; PLAN: r0=245(x1), r1=77(y1), r2=227(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 77
LDI r2, 227
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
