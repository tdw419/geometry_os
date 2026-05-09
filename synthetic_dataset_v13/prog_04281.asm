; DESCRIPTION: Renders a blue line between points (65, 51) and (185, 13).
; PLAN: r0=65(x1), r1=51(y1), r2=185(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 51
LDI r2, 185
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
