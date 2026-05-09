; DESCRIPTION: Renders a blue line between points (315, 184) and (415, 1).
; PLAN: r0=315(x1), r1=184(y1), r2=415(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 184
LDI r2, 415
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
