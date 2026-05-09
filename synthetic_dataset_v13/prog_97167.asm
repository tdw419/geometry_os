; DESCRIPTION: Renders a blue line between points (138, 17) and (481, 250).
; PLAN: r0=138(x1), r1=17(y1), r2=481(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 17
LDI r2, 481
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
