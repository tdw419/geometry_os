; DESCRIPTION: Renders a white line between points (216, 158) and (453, 133).
; PLAN: r0=216(x1), r1=158(y1), r2=453(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 158
LDI r2, 453
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
