; DESCRIPTION: Renders a blue line between points (489, 144) and (342, 225).
; PLAN: r0=489(x1), r1=144(y1), r2=342(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 144
LDI r2, 342
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
