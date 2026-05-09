; DESCRIPTION: Renders a purple line between points (395, 59) and (138, 74).
; PLAN: r0=395(x1), r1=59(y1), r2=138(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 59
LDI r2, 138
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
