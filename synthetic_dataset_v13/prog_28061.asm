; DESCRIPTION: Renders a blue line between points (188, 172) and (142, 220).
; PLAN: r0=188(x1), r1=172(y1), r2=142(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 172
LDI r2, 142
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
