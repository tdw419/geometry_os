; DESCRIPTION: Renders a blue line between points (14, 230) and (216, 28).
; PLAN: r0=14(x1), r1=230(y1), r2=216(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 230
LDI r2, 216
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
