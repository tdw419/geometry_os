; DESCRIPTION: Renders a blue line between points (21, 238) and (91, 181).
; PLAN: r0=21(x1), r1=238(y1), r2=91(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 238
LDI r2, 91
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
