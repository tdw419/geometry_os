; DESCRIPTION: Renders a blue line between points (89, 88) and (18, 124).
; PLAN: r0=89(x1), r1=88(y1), r2=18(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 88
LDI r2, 18
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
