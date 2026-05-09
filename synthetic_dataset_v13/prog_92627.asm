; DESCRIPTION: Renders a blue line between points (324, 20) and (489, 217).
; PLAN: r0=324(x1), r1=20(y1), r2=489(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 20
LDI r2, 489
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
