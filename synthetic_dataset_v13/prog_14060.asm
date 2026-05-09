; DESCRIPTION: Renders a blue line between points (222, 145) and (35, 119).
; PLAN: r0=222(x1), r1=145(y1), r2=35(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 145
LDI r2, 35
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
