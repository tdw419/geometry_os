; DESCRIPTION: Renders a blue line between points (1, 157) and (455, 155).
; PLAN: r0=1(x1), r1=157(y1), r2=455(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 157
LDI r2, 455
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
