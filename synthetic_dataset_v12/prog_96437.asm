; DESCRIPTION: Renders a blue line between points (16, 88) and (478, 220).
; PLAN: r0=16(x1), r1=88(y1), r2=478(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 88
LDI r2, 478
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
