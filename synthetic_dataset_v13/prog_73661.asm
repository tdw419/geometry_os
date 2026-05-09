; DESCRIPTION: Renders a blue line between points (315, 221) and (50, 149).
; PLAN: r0=315(x1), r1=221(y1), r2=50(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 221
LDI r2, 50
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
