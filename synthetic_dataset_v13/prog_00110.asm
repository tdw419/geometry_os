; DESCRIPTION: Renders a blue line between points (375, 206) and (112, 116).
; PLAN: r0=375(x1), r1=206(y1), r2=112(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 206
LDI r2, 112
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
