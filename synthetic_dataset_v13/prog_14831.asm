; DESCRIPTION: Renders a purple line between points (424, 78) and (202, 62).
; PLAN: r0=424(x1), r1=78(y1), r2=202(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 78
LDI r2, 202
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
