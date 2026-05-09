; DESCRIPTION: Renders a purple line between points (466, 146) and (10, 123).
; PLAN: r0=466(x1), r1=146(y1), r2=10(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 146
LDI r2, 10
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
