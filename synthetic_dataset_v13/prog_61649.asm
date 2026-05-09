; DESCRIPTION: Renders a yellow line between points (106, 219) and (486, 148).
; PLAN: r0=106(x1), r1=219(y1), r2=486(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 219
LDI r2, 486
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
