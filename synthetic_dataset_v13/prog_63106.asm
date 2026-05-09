; DESCRIPTION: Renders a blue line between points (180, 35) and (200, 62).
; PLAN: r0=180(x1), r1=35(y1), r2=200(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 35
LDI r2, 200
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
