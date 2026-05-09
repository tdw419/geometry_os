; DESCRIPTION: Renders a blue line between points (124, 244) and (481, 232).
; PLAN: r0=124(x1), r1=244(y1), r2=481(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 244
LDI r2, 481
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
