; DESCRIPTION: Renders a black line between points (188, 133) and (155, 70).
; PLAN: r0=188(x1), r1=133(y1), r2=155(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 133
LDI r2, 155
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
