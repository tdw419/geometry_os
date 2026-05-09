; DESCRIPTION: Renders a yellow line between points (499, 142) and (129, 136).
; PLAN: r0=499(x1), r1=142(y1), r2=129(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 142
LDI r2, 129
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
