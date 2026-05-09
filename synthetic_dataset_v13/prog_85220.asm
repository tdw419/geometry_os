; DESCRIPTION: Renders a green line between points (369, 169) and (249, 13).
; PLAN: r0=369(x1), r1=169(y1), r2=249(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 169
LDI r2, 249
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
