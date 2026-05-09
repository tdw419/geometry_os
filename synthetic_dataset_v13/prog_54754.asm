; DESCRIPTION: Renders a blue line between points (47, 54) and (101, 237).
; PLAN: r0=47(x1), r1=54(y1), r2=101(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 54
LDI r2, 101
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
