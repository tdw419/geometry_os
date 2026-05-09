; DESCRIPTION: Renders a blue line between points (175, 61) and (200, 153).
; PLAN: r0=175(x1), r1=61(y1), r2=200(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 61
LDI r2, 200
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
