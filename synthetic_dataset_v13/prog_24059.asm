; DESCRIPTION: Renders a blue line between points (136, 222) and (463, 157).
; PLAN: r0=136(x1), r1=222(y1), r2=463(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 222
LDI r2, 463
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
