; DESCRIPTION: Renders a blue line between points (435, 49) and (278, 188).
; PLAN: r0=435(x1), r1=49(y1), r2=278(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 49
LDI r2, 278
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
