; DESCRIPTION: Renders a blue line between points (495, 49) and (73, 71).
; PLAN: r0=495(x1), r1=49(y1), r2=73(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 49
LDI r2, 73
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
