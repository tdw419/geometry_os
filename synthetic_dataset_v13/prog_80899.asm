; DESCRIPTION: Renders a yellow line between points (373, 136) and (501, 149).
; PLAN: r0=373(x1), r1=136(y1), r2=501(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 136
LDI r2, 501
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
