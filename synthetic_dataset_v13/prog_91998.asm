; DESCRIPTION: Renders a yellow line between points (251, 227) and (125, 209).
; PLAN: r0=251(x1), r1=227(y1), r2=125(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 227
LDI r2, 125
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
