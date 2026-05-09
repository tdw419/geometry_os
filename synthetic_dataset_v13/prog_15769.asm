; DESCRIPTION: Renders a red line between points (369, 164) and (485, 155).
; PLAN: r0=369(x1), r1=164(y1), r2=485(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 164
LDI r2, 485
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
