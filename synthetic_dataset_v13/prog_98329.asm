; DESCRIPTION: Renders a red line between points (296, 76) and (369, 207).
; PLAN: r0=296(x1), r1=76(y1), r2=369(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 76
LDI r2, 369
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
