; DESCRIPTION: Renders a blue line between points (489, 250) and (261, 141).
; PLAN: r0=489(x1), r1=250(y1), r2=261(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 250
LDI r2, 261
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
