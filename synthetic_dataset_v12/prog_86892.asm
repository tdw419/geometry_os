; DESCRIPTION: Renders a blue line between points (56, 36) and (489, 1).
; PLAN: r0=56(x1), r1=36(y1), r2=489(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 36
LDI r2, 489
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
