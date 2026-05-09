; DESCRIPTION: Renders a blue line between points (161, 11) and (92, 250).
; PLAN: r0=161(x1), r1=11(y1), r2=92(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 11
LDI r2, 92
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
