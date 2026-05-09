; DESCRIPTION: Renders a blue line between points (321, 38) and (93, 219).
; PLAN: r0=321(x1), r1=38(y1), r2=93(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 38
LDI r2, 93
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
