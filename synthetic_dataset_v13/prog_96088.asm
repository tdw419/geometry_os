; DESCRIPTION: Renders a red line between points (158, 17) and (125, 148).
; PLAN: r0=158(x1), r1=17(y1), r2=125(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 17
LDI r2, 125
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
