; DESCRIPTION: Renders a yellow line between points (118, 162) and (136, 92).
; PLAN: r0=118(x1), r1=162(y1), r2=136(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 162
LDI r2, 136
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
