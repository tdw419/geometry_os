; DESCRIPTION: Renders a white line between points (369, 192) and (169, 160).
; PLAN: r0=369(x1), r1=192(y1), r2=169(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 192
LDI r2, 169
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
