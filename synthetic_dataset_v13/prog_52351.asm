; DESCRIPTION: Renders a blue line between points (190, 138) and (382, 78).
; PLAN: r0=190(x1), r1=138(y1), r2=382(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 138
LDI r2, 382
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
