; DESCRIPTION: Renders a green line between points (88, 148) and (369, 17).
; PLAN: r0=88(x1), r1=148(y1), r2=369(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 148
LDI r2, 369
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
