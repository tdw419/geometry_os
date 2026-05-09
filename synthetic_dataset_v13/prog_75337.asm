; DESCRIPTION: Renders a blue line between points (369, 137) and (217, 54).
; PLAN: r0=369(x1), r1=137(y1), r2=217(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 137
LDI r2, 217
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
