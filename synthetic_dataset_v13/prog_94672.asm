; DESCRIPTION: Renders a blue line between points (247, 238) and (153, 6).
; PLAN: r0=247(x1), r1=238(y1), r2=153(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 238
LDI r2, 153
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
