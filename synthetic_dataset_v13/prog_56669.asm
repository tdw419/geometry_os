; DESCRIPTION: Renders a blue line between points (141, 221) and (58, 24).
; PLAN: r0=141(x1), r1=221(y1), r2=58(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 221
LDI r2, 58
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
