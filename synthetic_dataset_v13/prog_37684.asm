; DESCRIPTION: Renders a blue line between points (39, 56) and (339, 21).
; PLAN: r0=39(x1), r1=56(y1), r2=339(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 56
LDI r2, 339
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
