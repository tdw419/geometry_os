; DESCRIPTION: Renders a blue line between points (51, 59) and (250, 119).
; PLAN: r0=51(x1), r1=59(y1), r2=250(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 59
LDI r2, 250
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
