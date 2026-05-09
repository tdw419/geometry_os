; DESCRIPTION: Renders a yellow line between points (37, 17) and (175, 227).
; PLAN: r0=37(x1), r1=17(y1), r2=175(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 17
LDI r2, 175
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
