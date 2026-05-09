; DESCRIPTION: Renders a green line between points (142, 136) and (459, 217).
; PLAN: r0=142(x1), r1=136(y1), r2=459(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 136
LDI r2, 459
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
