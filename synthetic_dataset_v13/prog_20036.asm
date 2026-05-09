; DESCRIPTION: Renders a blue line between points (455, 88) and (140, 199).
; PLAN: r0=455(x1), r1=88(y1), r2=140(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 88
LDI r2, 140
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
