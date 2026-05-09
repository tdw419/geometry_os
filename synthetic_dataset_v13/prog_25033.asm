; DESCRIPTION: Renders a blue line between points (39, 146) and (336, 115).
; PLAN: r0=39(x1), r1=146(y1), r2=336(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 146
LDI r2, 336
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
