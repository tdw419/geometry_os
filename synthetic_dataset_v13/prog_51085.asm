; DESCRIPTION: Renders a yellow line between points (194, 211) and (138, 119).
; PLAN: r0=194(x1), r1=211(y1), r2=138(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 211
LDI r2, 138
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
