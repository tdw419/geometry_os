; DESCRIPTION: Renders a purple line between points (34, 59) and (266, 34).
; PLAN: r0=34(x1), r1=59(y1), r2=266(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 59
LDI r2, 266
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
