; DESCRIPTION: Renders a white line between points (55, 238) and (377, 149).
; PLAN: r0=55(x1), r1=238(y1), r2=377(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 238
LDI r2, 377
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
