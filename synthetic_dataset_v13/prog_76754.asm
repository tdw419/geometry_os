; DESCRIPTION: Renders a black line between points (133, 41) and (369, 74).
; PLAN: r0=133(x1), r1=41(y1), r2=369(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 41
LDI r2, 369
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
