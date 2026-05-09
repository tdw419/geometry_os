; DESCRIPTION: Renders a blue line between points (120, 92) and (385, 122).
; PLAN: r0=120(x1), r1=92(y1), r2=385(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 92
LDI r2, 385
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
