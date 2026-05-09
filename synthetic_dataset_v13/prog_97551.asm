; DESCRIPTION: Renders a blue line between points (476, 38) and (479, 237).
; PLAN: r0=476(x1), r1=38(y1), r2=479(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 38
LDI r2, 479
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
