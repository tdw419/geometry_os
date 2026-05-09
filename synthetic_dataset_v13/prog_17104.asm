; DESCRIPTION: Renders a blue line between points (117, 92) and (299, 199).
; PLAN: r0=117(x1), r1=92(y1), r2=299(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 92
LDI r2, 299
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
