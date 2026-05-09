; DESCRIPTION: Renders a blue line between points (336, 59) and (169, 109).
; PLAN: r0=336(x1), r1=59(y1), r2=169(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 59
LDI r2, 169
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
