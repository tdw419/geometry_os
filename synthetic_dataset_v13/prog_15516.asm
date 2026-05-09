; DESCRIPTION: Renders a blue line between points (114, 93) and (169, 17).
; PLAN: r0=114(x1), r1=93(y1), r2=169(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 93
LDI r2, 169
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
