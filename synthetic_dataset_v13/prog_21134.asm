; DESCRIPTION: Renders a blue line between points (86, 157) and (22, 212).
; PLAN: r0=86(x1), r1=157(y1), r2=22(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 157
LDI r2, 22
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
