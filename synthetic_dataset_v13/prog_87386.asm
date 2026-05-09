; DESCRIPTION: Renders a blue line between points (480, 158) and (480, 153).
; PLAN: r0=480(x1), r1=158(y1), r2=480(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 158
LDI r2, 480
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
