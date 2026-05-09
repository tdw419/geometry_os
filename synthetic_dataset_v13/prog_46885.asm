; DESCRIPTION: Renders a blue line between points (227, 72) and (315, 161).
; PLAN: r0=227(x1), r1=72(y1), r2=315(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 72
LDI r2, 315
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
