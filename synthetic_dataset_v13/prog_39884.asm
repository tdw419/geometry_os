; DESCRIPTION: Renders a blue line between points (270, 131) and (197, 116).
; PLAN: r0=270(x1), r1=131(y1), r2=197(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 131
LDI r2, 197
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
