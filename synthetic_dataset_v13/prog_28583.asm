; DESCRIPTION: Renders a blue line between points (200, 113) and (474, 148).
; PLAN: r0=200(x1), r1=113(y1), r2=474(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 113
LDI r2, 474
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
