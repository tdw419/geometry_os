; DESCRIPTION: Renders a yellow line between points (369, 36) and (500, 108).
; PLAN: r0=369(x1), r1=36(y1), r2=500(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 36
LDI r2, 500
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
