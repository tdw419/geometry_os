; DESCRIPTION: Renders a blue line between points (144, 188) and (255, 119).
; PLAN: r0=144(x1), r1=188(y1), r2=255(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 188
LDI r2, 255
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
