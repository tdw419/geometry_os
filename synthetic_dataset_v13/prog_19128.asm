; DESCRIPTION: Renders a blue line between points (280, 108) and (119, 212).
; PLAN: r0=280(x1), r1=108(y1), r2=119(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 108
LDI r2, 119
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
