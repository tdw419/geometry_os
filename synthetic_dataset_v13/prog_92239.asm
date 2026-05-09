; DESCRIPTION: Renders a blue line between points (369, 102) and (493, 230).
; PLAN: r0=369(x1), r1=102(y1), r2=493(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 102
LDI r2, 493
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
