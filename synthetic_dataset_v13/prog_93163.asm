; DESCRIPTION: Renders a blue line between points (313, 193) and (369, 179).
; PLAN: r0=313(x1), r1=193(y1), r2=369(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 193
LDI r2, 369
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
