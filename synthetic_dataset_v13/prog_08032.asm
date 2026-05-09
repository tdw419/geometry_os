; DESCRIPTION: Renders a yellow line between points (34, 136) and (81, 48).
; PLAN: r0=34(x1), r1=136(y1), r2=81(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 136
LDI r2, 81
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
