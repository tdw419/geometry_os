; DESCRIPTION: Renders a white line between points (369, 121) and (191, 29).
; PLAN: r0=369(x1), r1=121(y1), r2=191(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 121
LDI r2, 191
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
