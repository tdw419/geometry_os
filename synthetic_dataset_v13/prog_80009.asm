; DESCRIPTION: Renders a blue line between points (200, 82) and (137, 121).
; PLAN: r0=200(x1), r1=82(y1), r2=137(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 82
LDI r2, 137
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
