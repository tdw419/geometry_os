; DESCRIPTION: Renders a blue line between points (380, 136) and (360, 254).
; PLAN: r0=380(x1), r1=136(y1), r2=360(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 136
LDI r2, 360
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
