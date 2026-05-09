; DESCRIPTION: Renders a blue line between points (238, 145) and (151, 38).
; PLAN: r0=238(x1), r1=145(y1), r2=151(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 145
LDI r2, 151
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
