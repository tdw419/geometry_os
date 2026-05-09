; DESCRIPTION: Renders a blue line between points (133, 59) and (416, 25).
; PLAN: r0=133(x1), r1=59(y1), r2=416(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 59
LDI r2, 416
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
