; DESCRIPTION: Renders a yellow line between points (296, 168) and (369, 99).
; PLAN: r0=296(x1), r1=168(y1), r2=369(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 168
LDI r2, 369
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
