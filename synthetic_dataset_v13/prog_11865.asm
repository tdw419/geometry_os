; DESCRIPTION: Renders a blue line between points (102, 38) and (250, 167).
; PLAN: r0=102(x1), r1=38(y1), r2=250(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 38
LDI r2, 250
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
