; DESCRIPTION: Renders a blue line between points (208, 238) and (131, 72).
; PLAN: r0=208(x1), r1=238(y1), r2=131(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 238
LDI r2, 131
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
